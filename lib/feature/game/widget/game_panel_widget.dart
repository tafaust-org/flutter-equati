import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equati/feature/game/model/game.dart';
import 'package:equati/shared/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class GamePanelWidget extends StatefulWidget {
  const GamePanelWidget(this.game, {super.key});

  final Game game;

  @override
  State<GamePanelWidget> createState() => _GamePanelWidgetState();
}

class _GamePanelWidgetState extends State<GamePanelWidget> {
  final Parser _parser = Parser();

  /// Holds equations of the form: [ '5 + 5 = 10' ]
  List<String> equations = [];

  late List<double> sources = [];

  /// Prompt which is shown in the user interface.
  Map<String, String> prompt = {
    'operand1': '',
    'operation': '',
    'operand2': '',
  };

  /// Stores the indices of source numbers which have been used and thus shall
  /// be disabled.
  List<int> disabledSources = [];
  String? error;
  bool won = false;

  @override
  void initState() {
    sources.addAll(widget.game.source);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) {
      return const LoadingWidget();
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const Text('instructions, maybe put them somewhere else?'),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text('Target: ${widget.game.target.toInt()}'),
                    ),
                  ),
                ),
                if (won)
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: Text('You have won!'),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: equations.length,
              itemBuilder: (context, index) => ListTile(
                title: Center(child: Text(equations[index])),
                trailing: index == equations.length - 1 && !won
                    ? GestureDetector(
                        onTap: () {
                          equations.removeAt(index);
                          _resetLastTwoSources();
                          sources.removeLast();
                          setState(() {});
                        },
                        child: const Icon(Icons.highlight_remove),
                      )
                    : null,
              ),
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Row(
                children: [
                  const Flexible(fit: FlexFit.tight, child: Text(' >')),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Text(error ?? prompt.values.join(' ')),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (prompt.values.join() == '') return;
                      // operand2 cannot be unequal empty string
                      if (prompt['operand1'] != '') {
                        disabledSources.removeLast();
                      }
                      _resetPrompt();
                      setState(() {});
                    },
                    child: Icon(
                      Icons.clear,
                      color: prompt.values.join() == ''
                          ? Theme.of(context).disabledColor
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    children: sources
                        .asMap()
                        .entries
                        .map(
                          (entry) => InkWell(
                            onTap: () {
                              if (disabledSources.contains(entry.key) || won) {
                                return;
                              }
                              _addToPrompt('number', entry.key);
                            },
                            child: Ink(
                              color: disabledSources.contains(entry.key)
                                  ? Theme.of(context).disabledColor
                                  : Theme.of(context).colorScheme.primary,
                              child: Center(
                                child: Text(
                                  '${entry.value.toInt()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(growable: true),
                  ),
                ),
                Flexible(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    children: widget.game.operations
                        .asMap()
                        .entries
                        .map(
                          (entry) => InkWell(
                            onTap: () {
                              if (won) {
                                return;
                              }
                              _addToPrompt('operation', entry.key);
                            },
                            child: Ink(
                              color: Theme.of(context).colorScheme.secondary,
                              child: Center(
                                child: Text(
                                  entry.value,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(growable: false),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _addToPrompt(String kind, int index) {
    // set values
    switch (kind) {
      case 'number':
        if (prompt['operand1'] == '') {
          prompt['operand1'] = sources[index].toInt().toString();
        } else if (prompt['operand2'] == '') {
          prompt['operand2'] = sources[index].toInt().toString();
        }
        disabledSources.add(index);
        break;
      case 'operation':
        if (prompt['operation'] == '') {
          prompt['operation'] = widget.game.operations[index];
        }
        break;
    }
    _evaluateExpressionWhenFinished();
    setState(() {}); // update UI
  }

  void _evaluateExpressionWhenFinished() {
    if (prompt.values.every((element) => element != '')) {
      final equation = prompt.values.join(' ');
      final equationResult = _parser.parse(equation);
      final result = equationResult.evaluate(
        EvaluationType.REAL,
        ContextModel(),
      ) as double;
      if (result != result.toInt() || result < 0) {
        _resetLastTwoSources();
        _resetPrompt();
        _showError('Result must be a positive integer');

        return;
      }
      won = widget.game.target == result;
      if (!won) {
        // add new source numbers as long as we have not won yet
        sources.add(result);
      }
      equations.add('$equation = ${result.toInt().toString()}');
      _resetPrompt();
    }
  }

  void _showError(String message) {
    error = message;
    Timer(
      const Duration(seconds: 2),
      () {
        error = null;
        setState(() {});
      },
    );
  }

  void _resetLastTwoSources() {
    disabledSources
      ..removeLast()
      ..removeLast();
  }

  void _resetPrompt() {
    prompt['operand1'] = '';
    prompt['operand2'] = '';
    prompt['operation'] = '';
  }

  Future<bool> _onWillPop() async {
    final result = await showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Leave current game?'),
          content: const Text('Your game state will not be saved.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Stay'),
              onPressed: () {
                context.router.pop(false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Theme.of(context).colorScheme.error),
              child: Text(
                'Leave',
                style: TextStyle(color: Theme.of(context).colorScheme.onError),
              ),
              onPressed: () {
                context.router.pop(true);
              },
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}

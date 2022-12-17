import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equati/feature/game/model/game.dart';
import 'package:equati/feature/game/provider/ingame_provider.dart' show inGameProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePanelWidget extends ConsumerWidget {
  const GamePanelWidget(this.game, {super.key});

  final Game game;

//   @override
//   State<GamePanelWidget> createState() => _GamePanelWidgetState();
// }
//
// class _GamePanelWidgetState extends State<GamePanelWidget> {
//   final Parser _parser = Parser();
//
//   /// Holds equations of the form: [ '5 + 5 = 10' ]
//   List<String> equations = [];
//
//   late List<double> sources = [];
//
//   /// Prompt which is shown in the user interface.
//   Map<String, String> prompt = {
//     'operand1': '',
//     'operation': '',
//     'operand2': '',
//   };
//
//   /// Stores the indices of source numbers which have been used and thus shall
//   /// be disabled.
//   List<int> disabledSources = [];
//   String? error;
//   bool won = false;
//
//   @override
//   void initState() {
//     sources.addAll(widget.game.source);
//     super.initState();
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inGameState = ref.watch(inGameProvider(game));
    final _inGameProvider = ref.read(inGameProvider(game).notifier);
    // if (!mounted) {
    //   return const LoadingWidget();
    // }

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
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
                      child: Text('Target: ${inGameState.target}'),
                    ),
                  ),
                ),
                if (inGameState.won)
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
              itemCount: inGameState.equations.length,
              itemBuilder: (context, index) => ListTile(
                title: Center(child: Text(inGameState.equations[index])),
                trailing: index == inGameState.equations.length - 1 &&
                        !inGameState.won
                    ? GestureDetector(
                        onTap: () {
                          _inGameProvider.undoLastEquation(index);
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
                    child: Text(inGameState.error ?? inGameState.textPrompt),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _inGameProvider.clearPrompt,
                    child: Icon(
                      Icons.clear,
                      color: inGameState.isPromptEmpty
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
                    children: inGameState.sources
                        .asMap()
                        .entries
                        .map(
                          (entry) => InkWell(
                            onTap: () {
                              _inGameProvider.addNumberToPrompt(entry.key);
                            },
                            child: Ink(
                              color: inGameState.disabledSources
                                      .contains(entry.key)
                                  ? Theme.of(context).disabledColor
                                  : Theme.of(context).colorScheme.primary,
                              child: Center(
                                child: Text(
                                  '${entry.value}',
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
                    children: inGameState.operations
                        .asMap()
                        .entries
                        .map(
                          (entry) => InkWell(
                            onTap: () {
                              _inGameProvider.addOperationToPrompt(entry.key);
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

  // void _addToPrompt(String kind, int index) {
  //   // set values
  //   switch (kind) {
  //     case 'number':
  //       if (prompt['operand1'] == '') {
  //         prompt['operand1'] = sources[index].toInt().toString();
  //       } else if (prompt['operand2'] == '') {
  //         prompt['operand2'] = sources[index].toInt().toString();
  //       }
  //       disabledSources.add(index);
  //       break;
  //     case 'operation':
  //       if (prompt['operation'] == '') {
  //         prompt['operation'] = widget.game.operations[index];
  //       }
  //       break;
  //   }
  //   _evaluateExpressionWhenFinished();
  //   setState(() {}); // update UI
  // }
  //
  // void _evaluateExpressionWhenFinished() {
  //   if (prompt.values.every((element) => element != '')) {
  //     final equation = prompt.values.join(' ');
  //     final equationResult = _parser.parse(equation);
  //     final result = equationResult.evaluate(
  //       EvaluationType.REAL,
  //       ContextModel(),
  //     ) as double;
  //     if (result != result.toInt() || result < 0) {
  //       _resetLastTwoSources();
  //       _resetPrompt();
  //       _showError('Result must be a positive integer');
  //
  //       return;
  //     }
  //     won = widget.game.target == result;
  //     if (!won) {
  //       // add new source numbers as long as we have not won yet
  //       sources.add(result);
  //     }
  //     equations.add('$equation = ${result.toInt().toString()}');
  //     _resetPrompt();
  //   }
  // }
  //
  // void _showError(String message) {
  //   error = message;
  //   Timer(
  //     const Duration(seconds: 2),
  //     () {
  //       error = null;
  //       setState(() {});
  //     },
  //   );
  // }
  //
  // void _resetLastTwoSources() {
  //   disabledSources
  //     ..removeLast()
  //     ..removeLast();
  // }
  //
  // void _resetPrompt() {
  //   prompt['operand1'] = '';
  //   prompt['operand2'] = '';
  //   prompt['operation'] = '';
  // }

  Future<bool> _onWillPop(BuildContext context) async {
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

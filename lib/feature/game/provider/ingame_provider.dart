import 'dart:async';

import 'package:equati/feature/game/model/game.dart';
import 'package:equati/feature/game/state/ingame_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

/// The [inGameProvider] is a family of [InGameProvider]s that consumes a [Game]
/// instance before it is able to return the [InGameState].
final inGameProvider =
    StateNotifierProvider.family<InGameProvider, InGameState, Game>(
  (
    Ref ref,
    Game game,
  ) {
    final initialState = InGameState(
      sources: game.source.map((e) => e.toInt()).toList(growable: false),
      operations: game.operations,
      target: game.target.toInt(),
    );

    return InGameProvider(ref, initialState: initialState);
  },
);

class InGameProvider extends StateNotifier<InGameState> {
  final Ref _ref;

  InGameProvider(
    this._ref, {
    required InGameState initialState,
  }) : super(initialState);

  /// The parser is used to evaluate string math equations.
  final Parser _parser = Parser();

  void _evaluatePromptExpression() {
    final equation = state.textPrompt;
    final equationResult = _parser.parse(equation);
    final result = equationResult.evaluate(
      EvaluationType.REAL,
      ContextModel(),
    ) as double;
    if (result != result.toInt() || result < 0) {
      resetLastTwoSources();
      _resetStatePrompt();
      showError('Result must be a positive integer');

      return;
    }
    final won = state.target == result.toInt();
    state = state.copyWith(won: won);
    if (!state.won) {
      final sources = List<int>.from(state.sources);
      // add new source numbers as long as we have not won yet
      state = state.copyWith(
        sources: [...sources, result.toInt()],
      );
    }
    final equations = List<String>.from(state.equations);
    state = state.copyWith(
      equations: [...equations, '$equation = ${result.toInt().toString()}'],
    );
    _resetStatePrompt();
  }

  void showError(String message) {
    state = state.copyWith(error: message);
    Timer(
      const Duration(seconds: 2),
      () {
        state = state.copyWith(error: null);
      },
    );
  }

  void resetLastTwoSources() {
    state = state.copyWith(
      disabledSources: List<int>.from(state.disabledSources)
        ..removeLast()
        ..removeLast(),
    );
  }

  void _resetStatePrompt() {
    state = state.copyWith(
      prompt: {
        'operand1': '',
        'operand2': '',
        'operation': '',
      },
    );
  }

  void clearPrompt() {
    if (state.prompt.values.join() == '') {
      return;
    }
    // operand2 cannot be unequal empty string, otherwise the equation is
    // automatically evaluated
    if (state.prompt['operand1'] != '') {
      state = state.copyWith(
          disabledSources: List<int>.from(state.disabledSources)..removeLast());
    }
    _resetStatePrompt();
  }

  void addNumberToPrompt(int index) {
    // business logic
    if (state.disabledSources.contains(index) || state.won) {
      return;
    }
    final prompt = Map<String, String>.from(state.prompt);
    if (state.prompt['operand1'] == '') {
      prompt['operand1'] = state.sources[index].toString();
    } else if (state.prompt['operand2'] == '') {
      prompt['operand2'] = state.sources[index].toString();
    }
    state = state.copyWith(
      prompt: prompt,
      disabledSources: [...state.disabledSources, index],
    );
    if (state.isPromptFull) {
      // evaluate the whole expression
      _evaluatePromptExpression();
    }
  }

  void addOperationToPrompt(int index) {
    // business logic
    if (state.won) {
      return;
    }
    final prompt = Map<String, String>.from(state.prompt);
    prompt['operation'] = state.operations[index];
    state = state.copyWith(prompt: prompt);
    if (state.isPromptFull) {
      // evaluate the whole expression
      _evaluatePromptExpression();
    }
  }

  void undoLastEquation(int index) {
    state = state.copyWith(
      equations: List<String>.from(state.equations)..removeAt(index),
      sources: List<int>.from(state.sources)..removeLast(),
    );
    resetLastTwoSources();
  }
}

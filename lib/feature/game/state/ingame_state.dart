import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingame_state.freezed.dart';

/// Complex in-game state
@freezed
class InGameState with _$InGameState {
  const InGameState._();

  const factory InGameState({
    // The list of numbers on the pad; initially set from the loaded game
    required List<int> sources,
    // The list of operations on the pad; initially set from the loaded game
    required List<String> operations,
    // The list of indices of sources which are disabled because they appear in
    // an equation
    @Default([]) List<int> disabledSources,
    // The target which is used to determine the win condition
    required int target,
    // Displays previous equations
    @Default([]) List<String> equations,
    // Displays the current equation
    @Default({
      'operand1': '',
      'operand2': '',
      'operation': '',
    }) Map<String, String> prompt,
    // Whether the game was won
    @Default(false) bool won,
    String? error,
  }) = _InGameState;

  String get textPrompt =>
      '${prompt['operand1']} ${prompt['operation']} ${prompt['operand2']}';

  bool get isPromptEmpty => prompt.values.any((element) => element.isEmpty);

  bool get isPromptFull => prompt.values.every((element) => element.isNotEmpty);
}

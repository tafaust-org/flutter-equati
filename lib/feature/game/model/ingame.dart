import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingame.freezed.dart';

@freezed
class InGame with _$InGame {
  const InGame._();

  const factory InGame({
    // The list of numbers on the pad
    required List<int> source,
    // The list of indices of sources which are disabled because they appear in
    // an equation
    required List<int> disabledSources,
    // The target which is used to determine the win condition
    required int target,
    // Displays previous equations
    required List<String> equations,
    // Displays the current equation
    required String prompt,
  }) = _InGame;
}

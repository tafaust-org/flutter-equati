import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

List<Game> gamesFromJson(List<dynamic> data) =>
    List<Game>.from(data.map((x) => Game.fromJson(x as Map<String, dynamic>)));

Game gameFromJson(String str) =>
    Game.fromJson(json.decode(str) as Map<String, dynamic>);

@freezed
class Game with _$Game {
  const Game._();

  const factory Game({
    @JsonKey(name: 'gameId') required String id,
    required List<double> source,
    required double target,
    required List<String> operations,
    DateTime? dailyChallenge,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}

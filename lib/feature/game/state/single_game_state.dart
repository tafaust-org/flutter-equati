import 'package:equati/feature/game/model/game.dart';
import 'package:equati/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_game_state.freezed.dart';

@freezed
class SingleGameState with _$SingleGameState {
  const factory SingleGameState.loading() = _Loading;

  const factory SingleGameState.gameLoaded(Game game) = _Loaded;

  const factory SingleGameState.error(AppException error) = _Error;
}

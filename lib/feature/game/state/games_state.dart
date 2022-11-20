import 'package:equati/feature/game/model/game.dart';
import 'package:equati/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'games_state.freezed.dart';

@freezed
class GamesState with _$GamesState {
  const factory GamesState.loading() = _Loading;

  const factory GamesState.gamesLoaded(List<Game> games) = _Loaded;

  const factory GamesState.error(AppException error) = _Error;
}

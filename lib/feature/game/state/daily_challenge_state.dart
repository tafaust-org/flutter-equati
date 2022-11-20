import 'package:equati/feature/game/model/game.dart';
import 'package:equati/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_challenge_state.freezed.dart';

@freezed
class DailyChallengeState with _$DailyChallengeState {
  const factory DailyChallengeState.loading() = _Loading;

  const factory DailyChallengeState.gameLoaded(Game game) = _Loaded;

  const factory DailyChallengeState.error(AppException error) = _Error;
}

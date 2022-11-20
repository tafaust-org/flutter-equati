import 'package:equati/app/provider/app_start_provider.dart';
import 'package:equati/app/state/app_start_state.dart';
import 'package:equati/feature/game/repository/games_repository.dart';
import 'package:equati/feature/game/state/daily_challenge_state.dart';
import 'package:equati/feature/game/state/single_game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dailyChallengeProvider =
    StateNotifierProvider<DailyChallengeProvider, DailyChallengeState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return DailyChallengeProvider(ref, appStartState);
});

class DailyChallengeProvider extends StateNotifier<DailyChallengeState> {
  DailyChallengeProvider(
    this._ref,
    this._appStartState,
  ) : super(const DailyChallengeState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;
  late final GamesRepository _gamesRepository = _ref.read(
    gamesRepositoryProvider,
  );

  Future<void> _init() async {
    _appStartState.maybeWhen(
      authenticated: () {
        _fetchDailyChallengeGame();
      },
      orElse: () {
        // todo log this
      },
    );
  }

  /// Starts the game which is currently the daily challenge.
  Future<void> _fetchDailyChallengeGame() async {
    state = const DailyChallengeState.loading();
    state = await _gamesRepository.fetchDailyChallenge();
  }
}

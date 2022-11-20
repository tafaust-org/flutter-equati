import 'package:equati/app/provider/app_start_provider.dart';
import 'package:equati/app/state/app_start_state.dart';
import 'package:equati/feature/game/repository/games_repository.dart';
import 'package:equati/feature/game/state/games_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gamesProvider = StateNotifierProvider<GamesProvider, GamesState>((ref) {
  final appStartState = ref.watch(appStartProvider);

  return GamesProvider(ref, appStartState);
});

class GamesProvider extends StateNotifier<GamesState> {
  GamesProvider(
    this._ref,
    this._appStartState,
  ) : super(const GamesState.loading()) {
    _init();
  }

  final Ref _ref;
  final AppStartState _appStartState;
  late final GamesRepository _repository = _ref.read(gamesRepositoryProvider);

  Future<void> _init() async {
    _appStartState.maybeWhen(
      authenticated: () {
        fetchGames();
      },
      orElse: () {
        // todo log this
      },
    );
  }

  Future<void> fetchGames({bool refetch = false}) async {
    final response = await _repository.fetchGames(refetch: refetch);
    if (mounted) {
      state = response;
    }
  }

  Future<void> refetchGames() async {
    await fetchGames(refetch: true);
  }
}

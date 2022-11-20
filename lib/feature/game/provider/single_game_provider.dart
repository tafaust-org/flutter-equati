import 'package:equati/feature/game/repository/games_repository.dart';
import 'package:equati/feature/game/state/single_game_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final singleGameProvider = StateNotifierProvider<SingleGameProvider, SingleGameState>(
  (ref) {
    return SingleGameProvider(ref);
  },
);

class SingleGameProvider extends StateNotifier<SingleGameState> {
  SingleGameProvider(this._ref) : super(const SingleGameState.loading());

  final Ref _ref;
  late final GamesRepository _repository = _ref.read(gamesRepositoryProvider);

  Future<void> fetchGameById(String id) async {
    final response = await _repository.fetchGameById(id);
    if (mounted) {
      state = response;
    }
  }
}

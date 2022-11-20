import 'package:equati/feature/home/state/home_state.dart';
import 'package:equati/shared/repository/token_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(ref);
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(this._ref) : super(const HomeState.loading());

  final Ref _ref;
  late final TokenRepository _tokenRepository =
      _ref.read(tokenRepositoryProvider);

  Future<void> logout() async {
    await _tokenRepository.remove();
    state = const HomeState.loggedOut();
  }
}

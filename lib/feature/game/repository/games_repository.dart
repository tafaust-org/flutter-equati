import 'package:equati/feature/game/model/game.dart';
import 'package:equati/feature/game/state/daily_challenge_state.dart';
import 'package:equati/feature/game/state/single_game_state.dart';
import 'package:equati/feature/game/state/games_state.dart';
import 'package:equati/shared/http/api_provider.dart';
import 'package:equati/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IGamesRepository {
  // Single games (GameState)
  Future<DailyChallengeState> fetchDailyChallenge();

  // Multiple games (Game*s*State)
  Future<GamesState> fetchGames();
}

final gamesRepositoryProvider = Provider(GamesRepository.new);

class GamesRepository implements IGamesRepository {
  GamesRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  /// Holds the current [Game] for the daily challenge.
  Game? _dailyChallengeGame;

  /// Holds the list of games that can be played.
  List<Game>? _games;

  @override
  Future<GamesState> fetchGames({bool refetch = false}) async {
    if (_games != null && !refetch) {
      return GamesState.gamesLoaded(_games!);
    }
    final response = await _api.get(
      '/v1/game/simple',
      // newBaseUrl: 'https://api.equati.de',
    );

    return response.maybeWhen(
      success: (dynamic value) {
        try {
          final games = gamesFromJson(value as List<dynamic>);
          _games = games;

          return GamesState.gamesLoaded(games);
        } catch (e) {
          return GamesState.error(AppException.errorWithMessage(e.toString()));
        }
      },
      error: (AppException error) {
        return GamesState.error(error);
      },
      orElse: () {
        return const GamesState.loading();
      },
    );
  }

  @override
  Future<DailyChallengeState> fetchDailyChallenge() async {
    if (_dailyChallengeGame != null) {
      return DailyChallengeState.gameLoaded(_dailyChallengeGame!);
    }
    final response = await _api.get(
      '/v1/game/daily_challenge',
      // newBaseUrl: 'https://api.equati.de',
    );

    return response.maybeWhen(
      success: (dynamic value) {
        try {
          Game dailyChallenge;
          try {
            dailyChallenge = gameFromJson(value as String);
          } catch (e) {
            dailyChallenge = Game.fromJson(value as Map<String, dynamic>);
          }

          return DailyChallengeState.gameLoaded(dailyChallenge);
        } catch (e) {
          return DailyChallengeState.error(
            AppException.errorWithMessage(
              e.toString(),
            ),
          );
        }
      },
      error: (AppException error) {
        return DailyChallengeState.error(error);
      },
      orElse: () {
        return const DailyChallengeState.loading();
      },
    );
  }

  Future<SingleGameState> fetchGameById(String id) async {
    Game? game;
    if (_games != null) {
      game = _games?.firstWhere((element) => element.id == id);
      if (game != null) {
        return SingleGameState.gameLoaded(game);
      }
    }
    final response = await _api.get(
      '/v1/game/simple/$id',
      // newBaseUrl: 'https://api.equati.de',
    );

    return response.when(
      success: (value) {
        game = Game.fromJson(value as Map<String, dynamic>);

        return SingleGameState.gameLoaded(game!);
      },
      error: (exception) {
        // error handling
        throw Error();
      },
    );
  }
}

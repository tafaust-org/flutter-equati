// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../app/widget/app_start_page.dart' as _i1;
import '../../feature/game/widget/daily_challenge_page.dart' as _i4;
import '../../feature/game/widget/game_page.dart' as _i5;
import '../../feature/game/widget/game_selection_page.dart' as _i3;
import '../../feature/home/widget/home_page.dart' as _i2;
import '../../feature/settings/widget/settings_page.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    GameSelectionRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.GameSelectionPage(),
      );
    },
    DailyChallengeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DailyChallengePage(),
        fullscreenDialog: true,
      );
    },
    GameRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<GameRouteArgs>(
          orElse: () => GameRouteArgs(id: pathParams.getString('id')));
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.GamePage(
          key: args.key,
          id: args.id,
        ),
        fullscreenDialog: true,
      );
    },
    SettingsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SettingsPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          AppStartRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              HomeRoute.name,
              path: '',
              parent: AppStartRoute.name,
            ),
            _i7.RouteConfig(
              GameSelectionRoute.name,
              path: 'selection',
              parent: AppStartRoute.name,
            ),
            _i7.RouteConfig(
              DailyChallengeRoute.name,
              path: 'daily_challenge',
              parent: AppStartRoute.name,
            ),
            _i7.RouteConfig(
              GameRoute.name,
              path: ':id',
              parent: AppStartRoute.name,
            ),
            _i7.RouteConfig(
              SettingsRoute.name,
              path: 'settings',
              parent: AppStartRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i7.PageRouteInfo<void> {
  const AppStartRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AppStartRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.GameSelectionPage]
class GameSelectionRoute extends _i7.PageRouteInfo<void> {
  const GameSelectionRoute()
      : super(
          GameSelectionRoute.name,
          path: 'selection',
        );

  static const String name = 'GameSelectionRoute';
}

/// generated route for
/// [_i4.DailyChallengePage]
class DailyChallengeRoute extends _i7.PageRouteInfo<void> {
  const DailyChallengeRoute()
      : super(
          DailyChallengeRoute.name,
          path: 'daily_challenge',
        );

  static const String name = 'DailyChallengeRoute';
}

/// generated route for
/// [_i5.GamePage]
class GameRoute extends _i7.PageRouteInfo<GameRouteArgs> {
  GameRoute({
    _i8.Key? key,
    required String id,
  }) : super(
          GameRoute.name,
          path: ':id',
          args: GameRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'GameRoute';
}

class GameRouteArgs {
  const GameRouteArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final String id;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsRoute';
}

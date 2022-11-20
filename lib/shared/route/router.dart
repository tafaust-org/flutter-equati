import 'package:auto_route/auto_route.dart';
import 'package:equati/app/widget/app_start_page.dart';
import 'package:equati/feature/game/widget/daily_challenge_page.dart';
import 'package:equati/feature/game/widget/game_selection_page.dart';
import 'package:equati/feature/settings/widget/settings_page.dart';
import 'package:flutter/material.dart';

import '../../feature/game/widget/game_page.dart';
import '../../feature/home/widget/home_page.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

// const authRoutes = [
//   AutoRoute(
//     path: '/signIn',
//     page: SignInPage,
//   ),
//   AutoRoute(
//     path: '/signUp',
//     page: SignUpPage,
//   ),
// ];

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: AppStartPage,
      initial: true,
      children: [
        AutoRoute(page: HomePage, path: ''),
        AutoRoute(page: GameSelectionPage, path: 'selection'),
        AutoRoute(
          page: DailyChallengePage,
          path: 'daily_challenge',
          fullscreenDialog: true,
        ),
        AutoRoute(
          page: GamePage,
          path: ':id',
          fullscreenDialog: true,
        ),
        AutoRoute(
          page: SettingsPage,
          path: 'settings',
        ),
      ],
    ),
    // AutoRoute(
    //   path: '/',
    //   page: AppStartPage,
    //   children: [
    //     AutoRoute(
    //       path: 'games',
    //       page: HomePage,
    //       initial: true,
    //     ),
    //     AutoRoute(
    //       path: 'scoreboard',
    //       page: ScoreboardPage,
    //     ),
    //   ],
    // ),
    // AutoRoute(
    //   path: 'games',
    //   name: 'GamesRouter',
    //   page: EmptyRouterWidget,
    //   children: [
    //     AutoRoute(
    //       path: '',
    //       page: HomePage,
    //     ),
    //     // AutoRoute(
    //     //   path: ':id',
    //     //   page: GamePage,
    //     // ),
    //   ],
    // ),
  ],
)
class $AppRouter {}

class EmptyRouterWidget extends StatelessWidget {
  const EmptyRouterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/widget/app_start_page.dart';

import '../../feature/auth/widget/sign_in_page.dart';
import '../../feature/auth/widget/sign_up_page.dart';
import '../../feature/home/widget/home_page.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {}
}

const homeRoutes = [
  AutoRoute(
    path: '/home',
    page: HomePage,
  ),
];

const authRoutes = [
  AutoRoute(
    path: '/signIn',
    page: SignInPage,
  ),
  AutoRoute(
    path: '/signUp',
    page: SignUpPage,
  ),
];

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //RedirectRoute(path: '*', redirectTo: '/'),
    AutoRoute(
      page: AppStartPage,
      initial: true,
    ),
    ...homeRoutes,
    ...authRoutes,
  ],
)
class $AppRouter {}

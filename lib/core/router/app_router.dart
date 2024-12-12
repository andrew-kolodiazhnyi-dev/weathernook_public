import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

const _durationInMilliseconds = 400;

@AutoRouterConfig(replaceInRouteName: 'Page|Tab,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          durationInMilliseconds: _durationInMilliseconds,
          initial: true,
          path: '/',
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          durationInMilliseconds: _durationInMilliseconds,
          path: '/home',
        ),
        CustomRoute(
          page: SearchRoute.page,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          durationInMilliseconds: _durationInMilliseconds,
          path: '/search',
        ),
        CustomRoute(
          page: SettingsRoute.page,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          durationInMilliseconds: _durationInMilliseconds,
          path: '/settings',
        ),
      ];
}

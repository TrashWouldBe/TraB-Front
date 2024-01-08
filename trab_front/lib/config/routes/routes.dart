// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trab_front/feature/auth/presentation/view/login_view.dart';

import 'package:trab_front/feature/flogging/presentation/view/map_view.dart';

@immutable
class Routes {
  const Routes._();

  /// The route to be loaded when app launches
  static const String initialRoute = AppStartupScreenRoute;

  static const String fallbackRoute = NotFoundScreenRoute;

  static const String AppStartupScreenRoute = '/';

  static const String NotFoundScreenRoute = '/route-not-found-screen';

  static const String LoginScreenRoute = '/auth/login';

  static const String MapScreenRoute = '/flogging/map';

  static final Map<String, Widget Function()> _routesMap = {
    AppStartupScreenRoute: () => const LogInView(),
    LoginScreenRoute: () => const LogInView(),
    MapScreenRoute: () => const MapView(),
  };

  static Widget Function() getRoute(String? routeName) {
    return routeExists(routeName)
        ? _routesMap[routeName]!
        : _routesMap[Routes.NotFoundScreenRoute]!;
  }

  static bool routeExists(String? routeName) {
    return _routesMap.containsKey(routeName);
  }
}

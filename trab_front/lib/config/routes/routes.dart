// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trab_front/feature/auth/presentation/view/login_screen.dart';
import 'package:trab_front/feature/flogging/presentation/view/flogging_end_screen.dart';
import 'package:trab_front/feature/flogging/presentation/view/flogging_stop_screen.dart';
import 'package:trab_front/feature/flogging/presentation/view/flogging_timer_screen.dart';
import 'package:trab_front/feature/flogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/home/presentation/view/home_screen.dart';

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

  static const String FloggingTimerScreenRoute = '/flogging/timer';

  static const String FloggingStopScreenRoute = '/flogging/stop';

  static const String FloggingEndScreenRoute = '/flogging/end';

  static const String HomeScreenRoute = '/home';

  static final Map<String, Widget Function()> _routesMap = {
    LoginScreenRoute: () => const LogInScreen(),
    MapScreenRoute: () => const MapScreen(),
    NotFoundScreenRoute: () => const SizedBox.shrink(),
    HomeScreenRoute: () => const HomeScreen(),
    FloggingTimerScreenRoute: () => const FlogginTimerScreen(),
    FloggingStopScreenRoute: () => const FlogginStopScreen(),
    FloggingEndScreenRoute: () => const FloggingEndScreen(),
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

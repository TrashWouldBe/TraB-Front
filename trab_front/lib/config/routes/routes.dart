// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trab_front/feature/auth/presentation/view/complete_set_trab_name_screen.dart';
import 'package:trab_front/feature/auth/presentation/view/login_screen.dart';
import 'package:trab_front/feature/auth/presentation/view/set_trab_name_screen.dart';
import 'package:trab_front/feature/camera/presentation/view/eatting_snack_trab_screen.dart';
import 'package:trab_front/feature/camera/presentation/view/sorted_trash_screen.dart';
import 'package:trab_front/feature/common/view/splash_screen.dart';
import 'package:trab_front/feature/mytrab/presentation/view/mytrab_furniture_screen.dart';
import 'package:trab_front/feature/mytrab/presentation/view/mytrab_snack_screen.dart';
import 'package:trab_front/feature/onBoarding/presentation/view/trab_onboarding_screen.dart';
import 'package:trab_front/feature/plogging/presentation/view/plogging_calculate_screen.dart';
import 'package:trab_front/feature/plogging/presentation/view/plogging_count_down_screen.dart';
import 'package:trab_front/feature/plogging/presentation/view/plogging_end_screen.dart';
import 'package:trab_front/feature/plogging/presentation/view/plogging_stop_screen.dart';
import 'package:trab_front/feature/plogging/presentation/view/plogging_timer_screen.dart';
import 'package:trab_front/feature/plogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/home/presentation/view/home_screen.dart';
import 'package:trab_front/feature/setting/presentation/view/plogging_record_screen.dart';

@immutable
class Routes {
  const Routes._();

  /// The route to be loaded when app launches
  static const String InitialRoute = AppStartupScreenRoute;

  static const String fallbackRoute = NotFoundScreenRoute;

  static const String AppStartupScreenRoute = '/';

  static const String TrabOnBoardingScreenRoute = '/trab-onboarding';

  static const String NotFoundScreenRoute = '/route-not-found-screen';

  static const String LoginScreenRoute = '/auth/login';

  static const String SetTrabNameScreenRoute = '/auth/set-trab-name';

  static const String CompleteSetTrabNameScreenRoute =
      '/auth/complete-set-trab-name';

  static const String PloggingCountScreenRoute = '/plogging/count';

  static const String MapScreenRoute = '/plogging/map';

  static const String PloggingTimerScreenRoute = '/plogging/timer';

  static const String PloggingStopScreenRoute = '/plogging/stop';

  static const String PloggingEndScreenRoute = '/plogging/end';

  static const String PloggingCalculateScreenRoute = '/plogging/calculate';

  static const String HomeScreenRoute = '/home';

  static const String PloggingRecordScreenRoute = '/setting/plogging-record';

  static const String SortedTrashScreenRoute = '/camera/sorted-trash';

  static const String EattingSnackTrabScreenRoute = '/camera/eatting-trab';

  static const String MyTrabFurnitureScreenRoute = '/mytrab/furniture';

  static const String MyTrabSnackScreenRoute = '/mytrab/snack';

  static final Map<String, Widget Function()> _routesMap = {
    AppStartupScreenRoute: () => const SplashScreen(),
    LoginScreenRoute: () => const LogInScreen(),
    MapScreenRoute: () => const MapScreen(),
    NotFoundScreenRoute: () => const SizedBox.shrink(),
    HomeScreenRoute: () => const HomeScreen(),
    PloggingTimerScreenRoute: () => const PloggingTimerScreen(),
    PloggingStopScreenRoute: () => const PloggingStopScreen(),
    PloggingCountScreenRoute: () => const PloggingCountDownScreen(),
    PloggingEndScreenRoute: () => const PloggingEndScreen(),
    PloggingRecordScreenRoute: () => const PloggingRecordScreen(),
    PloggingCalculateScreenRoute: () => const PloggingCalculateScreen(),
    SortedTrashScreenRoute: () => const SortedTrashScreen(),
    EattingSnackTrabScreenRoute: () => const EattingSnackTrabScreen(),
    SetTrabNameScreenRoute: () => const SetTrabNameScreen(),
    CompleteSetTrabNameScreenRoute: () => const CompleteSetTrabNameScreen(),
    MyTrabFurnitureScreenRoute: () => const MyTrabFurnitureScreen(),
    MyTrabSnackScreenRoute: () => const MyTrabSnackScreen(),
    TrabOnBoardingScreenRoute: () => const TrabOnBoardingScreen(),
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

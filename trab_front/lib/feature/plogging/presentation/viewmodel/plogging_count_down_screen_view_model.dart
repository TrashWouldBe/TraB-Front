import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';

part 'plogging_count_down_screen_view_model.g.dart';

class PloggingCountDownScreenState {
  int count;
  PloggingCountDownScreenState({required this.count});
}

@riverpod
class PloggingCountDownScreenController
    extends _$PloggingCountDownScreenController {
  @override
  PloggingCountDownScreenState build() {
    return PloggingCountDownScreenState(
      count: 3,
    );
  }

  void setState() {
    state = PloggingCountDownScreenState(count: state.count);
  }

  void startCountdown() {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (state.count == 1) {
          timer.cancel();
          navigateToNextScreen();
        } else {
          state.count--;
          setState();
        }
      },
    );
  }

  void navigateToNextScreen() {
    state.count = 3;
    AppRouter.pushNamed(Routes.PloggingTimerScreenRoute);
  }
}

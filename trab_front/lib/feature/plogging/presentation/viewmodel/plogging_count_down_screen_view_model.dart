import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_info_view_model.dart';

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
        if (state.count == 0) {
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
    ref.read(ploggingInfoControllerProvider.notifier).startTimer();
    AppRouter.pushAndRemoveUntil(Routes.PloggingTimerScreenRoute);
  }
}

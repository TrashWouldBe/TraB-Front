import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_info_view_model.dart';
import 'package:trab_front/feature/flogging/presentation/widget/stop_modal_info.dart';
part 'flogging_stop_view_model.g.dart';

class FloggingStopState {
  FloggingStopState();
}

@riverpod
class FloggingStopController extends _$FloggingStopController {
  @override
  FloggingStopState build() {
    return FloggingStopState();
  }

  void handlePressedStartButton() {
    AppRouter.pop();
    AppRouter.popAndPushNamed(Routes.FloggingTimerScreenRoute);
  }

  void handlePressedStopButton() {
    AppRouter.popUntilRoot();
    AppRouter.popAndPushNamed(Routes.FloggingEndScreenRoute);
  }

  void showTrabInfos({
    required BuildContext context,
  }) {
    ref.read(floggingInfoControllerProvider.notifier).stopTimer();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      builder: (BuildContext context) {
        return trabModalInfos(
          snack: "0",
          calorie: "0",
          time: ref.read(floggingInfoControllerProvider).time,
          distance: "3",
          onPressedStartButton: handlePressedStartButton,
          onPressedStopButton: handlePressedStopButton,
        );
      },
    );
  }

  void startTimer({required BuildContext context}) {
    ref.read(floggingInfoControllerProvider.notifier).startTimer();
  }
}

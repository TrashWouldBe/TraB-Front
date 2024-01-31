import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_info_view_model.dart';
import 'package:trab_front/feature/plogging/presentation/widget/plogging_stop_modal_info.dart';

part 'plogging_stop_view_model.g.dart';

class PloggingStopState {
  PloggingStopState();
}

@riverpod
class PloggingStopController extends _$PloggingStopController {
  @override
  PloggingStopState build() {
    return PloggingStopState();
  }

  void handlePressedStartButton() {
    AppRouter.pop();
    AppRouter.popAndPushNamed(Routes.PloggingTimerScreenRoute);
  }

  void handlePressedStopButton() {
    AppRouter.pushNamed(Routes.PloggingEndScreenRoute);
  }

  void showTrabInfos({
    required BuildContext context,
  }) {
    ref.read(ploggingInfoControllerProvider.notifier).stopTimer();
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
          ploggingInfo: ref.read(ploggingInfoControllerProvider).ploggingInfo,
          onPressedStartButton: handlePressedStartButton,
          onPressedStopButton: handlePressedStopButton,
        );
      },
    );
  }
}

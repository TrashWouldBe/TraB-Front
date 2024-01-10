import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
part 'flogging_info_view_model.g.dart';

class FloggingInfoState {
  int snack;
  int calories;
  String time;
  String distance;
  FloggingInfoState(
      {required this.snack,
      required this.distance,
      required this.calories,
      required this.time});
}

@Riverpod(keepAlive: true)
class FloggingInfoController extends _$FloggingInfoController {
  @override
  FloggingInfoState build() {
    return FloggingInfoState(
      snack: 0,
      calories: 0,
      time: "0.00",
      distance: "0.00",
    );
  }

  bool isRunning = false;
  Timer? timer;

  void setState() {
    state = FloggingInfoState(
        distance: state.distance,
        snack: state.snack,
        calories: state.calories,
        time: state.time);
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      isRunning = true;
      state.time = state.time.getTimerFormatted();
      setState();
    });
  }

  void stopTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      isRunning = false;
    }
  }
}

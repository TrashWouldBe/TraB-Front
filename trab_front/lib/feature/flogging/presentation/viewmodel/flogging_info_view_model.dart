import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
part 'flogging_info_view_model.g.dart';

class FloggingInfoState {
  int snack;
  int calories;
  String time;
  String distance;
  bool isFlogging;
  FloggingInfoState(
      {required this.snack,
      required this.distance,
      required this.calories,
      required this.time,
      required this.isFlogging});
}

@Riverpod(keepAlive: true)
class FloggingInfoController extends _$FloggingInfoController {
  @override
  FloggingInfoState build() {
    return FloggingInfoState(
      snack: 0,
      calories: 0,
      time: "0:00",
      distance: "0.00",
      isFlogging: true,
    );
  }

  Timer? timer;

  void setState() {
    state = FloggingInfoState(
        distance: state.distance,
        snack: state.snack,
        calories: state.calories,
        isFlogging: state.isFlogging,
        time: state.time);
  }

  void startTimer() {
    if (!state.isFlogging) {
      state.isFlogging = true;
      setState();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state.time = state.time.getTimerFormatted();
      setState();
    });
  }

  void stopTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      state.isFlogging = false;
      setState();
    }
  }
}

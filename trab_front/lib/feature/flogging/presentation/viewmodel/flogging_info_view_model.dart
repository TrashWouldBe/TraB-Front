import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
part 'flogging_info_view_model.g.dart';

//TODO: 객체화
class FloggingInfoState {
  int calories;
  String time;
  String distance;
  bool isFlogging;
  List<File> trabSnacks;
  FloggingInfoState(
      {required this.trabSnacks,
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
      trabSnacks: [],
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
        trabSnacks: state.trabSnacks,
        calories: state.calories,
        isFlogging: state.isFlogging,
        time: state.time);
  }

  Future<void> getImage({required ImageSource imageSource}) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      File img = File(image.path);
      state.trabSnacks.add(img);
      setState();
    }
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

  //TODO: 간식 정산할때 호출
  void endTimer() {
    stopTimer();
    state.time = "0:00";
    state.distance = "0.00";
    state.calories = 0;
    state.trabSnacks = [];
    state.isFlogging = false;
    setState();
  }
}

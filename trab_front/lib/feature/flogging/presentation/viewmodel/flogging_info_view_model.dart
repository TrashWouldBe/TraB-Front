import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/map_screen_view_model.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
part 'flogging_info_view_model.g.dart';

//TODO: 객체화
class FloggingInfoState {
  int calories;
  String time;
  double distance;
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
      time: AppStrings.initialTime,
      distance: 0,
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
      ref
          .read(mapScreenControllerProvider.notifier)
          .startLocationSubscription();
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
      ref
          .read(mapScreenControllerProvider.notifier)
          .cancleLocationSubscription();
      setState();
    }
  }

  //TODO: 간식 정산할때 호출
  void endTimer() {
    stopTimer();
    state.time = AppStrings.initialTime;
    state.distance = 0;
    state.calories = 0;
    state.trabSnacks = [];
    state.isFlogging = false;
    ref.read(mapScreenControllerProvider.notifier).clearPolylines();
    setState();
  }

  void calculateDistance({
    required LatLng? lastPosition,
    required LatLng newPosition,
  }) {
    if (lastPosition != null) {
      double distance = Geolocator.distanceBetween(
        lastPosition.latitude,
        lastPosition.longitude,
        newPosition.latitude,
        newPosition.longitude,
      );

      state.distance += distance;
      setState();
    }
  }
}

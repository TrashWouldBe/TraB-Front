import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/map_screen_view_model.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
part 'plogging_info_view_model.g.dart';

//TODO: 객체화
class PloggingInfoState {
  int calories;
  String time;
  double distance;
  bool isPlogging;
  List<File> trabSnacks;
  PloggingInfoState(
      {required this.trabSnacks,
      required this.distance,
      required this.calories,
      required this.time,
      required this.isPlogging});
}

@Riverpod(keepAlive: true)
class PloggingInfoController extends _$PloggingInfoController {
  @override
  PloggingInfoState build() {
    return PloggingInfoState(
      trabSnacks: [],
      calories: 0,
      time: AppStrings.initialTime,
      distance: 0,
      isPlogging: true,
    );
  }

  Timer? timer;

  void setState() {
    state = PloggingInfoState(
        distance: state.distance,
        trabSnacks: state.trabSnacks,
        calories: state.calories,
        isPlogging: state.isPlogging,
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
    if (!state.isPlogging) {
      state.isPlogging = true;
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
      state.isPlogging = false;
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
    state.isPlogging = false;
    ref.read(mapScreenControllerProvider.notifier).clearPolylines();
    setState();
  }

  void calculateDistance({
    required LatLng? lastPosition,
    required LatLng newPosition,
  }) {
    if (lastPosition != null) {
      double distanceInMeters = Geolocator.distanceBetween(
        lastPosition.latitude,
        lastPosition.longitude,
        newPosition.latitude,
        newPosition.longitude,
      );
      state.distance += distanceInMeters / 1000;
      setState();
    }
  }
}

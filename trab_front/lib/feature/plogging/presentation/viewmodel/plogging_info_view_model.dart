import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/auth/domain/user_domain.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/feature/plogging/presentation/types.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/map_screen_view_model.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/datetime_extension.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
part 'plogging_info_view_model.g.dart';

const double MAT = 1.036;

class PloggingInfoState {
  PloggingInfo ploggingInfo;
  bool isPlogging;
  PloggingInfoState({required this.ploggingInfo, required this.isPlogging});
}

@Riverpod(keepAlive: true)
class PloggingInfoController extends _$PloggingInfoController {
  @override
  PloggingInfoState build() {
    return PloggingInfoState(
      ploggingInfo: PloggingInfo(
          runDate: DateTime.now().getCurrentDateFormatted(),
          runName: AppStrings.empty,
          runRange: 0,
          runTime: AppStrings.initialTime,
          calorie: 0,
          images: []),
      isPlogging: true,
    );
  }

  Timer? timer;

  void setState() {
    state = PloggingInfoState(
      ploggingInfo: state.ploggingInfo,
      isPlogging: state.isPlogging,
    );
  }

  Future<void> getImage({required ImageSource imageSource}) async {
    Loading.show();
    stopTimer();
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      File img = File(image.path);
      state.ploggingInfo = state.ploggingInfo.copyWith(
        images: [...state.ploggingInfo.images, img],
      );
      setState();
    }
    startTimer();
    Loading.close();
  }

  void startTimer() {
    int? weight = ref.read(userControllerProvider).userInfo?.weight;
    if (!state.isPlogging) {
      state.isPlogging = true;
      ref
          .read(mapScreenControllerProvider.notifier)
          .startLocationSubscription();
      setState();
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (weight != null) {
          state.ploggingInfo = state.ploggingInfo.copyWith(
              calorie: (MAT * weight * (state.ploggingInfo.runRange)).round());
        }
        state.ploggingInfo = state.ploggingInfo.copyWith(
          runTime: state.ploggingInfo.runTime.getTimerFormatted(),
        );

        setState();
      },
    );
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
    state.ploggingInfo = PloggingInfo(
        runDate: DateTime.now().getCurrentDateFormatted(),
        runName: AppStrings.empty,
        runRange: 0,
        calorie: 0,
        runTime: AppStrings.initialTime,
        images: []);
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
      state.ploggingInfo = state.ploggingInfo.copyWith(
          runRange: state.ploggingInfo.runRange + (distanceInMeters / 1000));
      setState();
    }
  }
}

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trab_front/feature/plogging/presentation/types.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_info_view_model.dart';
import 'package:trab_front/feature/plogging/presentation/widget/plogging_infos.dart';
import 'package:trab_front/feature/plogging/presentation/widget/timer_bottom_buttons.dart';

import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_gifs.dart';
import 'package:trab_front/helpers/constants/app_images.dart';

class PloggingTimerScreen extends ConsumerStatefulWidget {
  const PloggingTimerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingTimerScreenState();
  }
}

class _PloggingTimerScreenState extends ConsumerState<PloggingTimerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(ploggingInfoControllerProvider.notifier).startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    String time = ref.watch(ploggingInfoControllerProvider).time;
    List<File> snacks = ref.watch(ploggingInfoControllerProvider).trabSnacks;
    bool isPlogging = ref.watch(ploggingInfoControllerProvider).isPlogging;
    double distance = ref.watch(ploggingInfoControllerProvider).distance;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 0.h,
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0.h,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.timerEllipse,
              ),
            ),
            Positioned(
              bottom: 0.h,
              left: 0.w,
              right: 250.w,
              top: 0,
              child: Transform(
                transform: Matrix4.rotationZ(-30 * pi / 180),
                alignment: Alignment.center,
                child: Image.asset(AppGifs.runTrab),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                ploggingTimerInfos(
                  snack: snacks.length.toString(),
                  calorie: "0",
                  time: time,
                  distance: distance.toStringAsFixed(2),
                  type: InfoType.timer,
                ),
                SizedBox(
                  height: 300.h,
                ),
                timerBottomButtons(
                  context: context,
                  isPlogging: isPlogging,
                  onPressedStartButton: ref
                      .read(ploggingInfoControllerProvider.notifier)
                      .startTimer,
                  onPressedCameraButton: () async => await ref
                      .read(ploggingInfoControllerProvider.notifier)
                      .getImage(imageSource: ImageSource.camera),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

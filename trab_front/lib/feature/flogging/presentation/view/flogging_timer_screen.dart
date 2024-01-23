import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trab_front/feature/common/widget/image.dart';
import 'package:trab_front/feature/flogging/presentation/types.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_info_view_model.dart';
import 'package:trab_front/feature/flogging/presentation/widget/flogging_infos.dart';
import 'package:trab_front/feature/flogging/presentation/widget/timer_bottom_buttons.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_gifs.dart';
import 'package:trab_front/helpers/constants/app_images.dart';

class FlogginTimerScreen extends ConsumerStatefulWidget {
  const FlogginTimerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FlogginTimerScreenState();
  }
}

class _FlogginTimerScreenState extends ConsumerState<FlogginTimerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(floggingInfoControllerProvider.notifier).startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    String _time = ref.watch(floggingInfoControllerProvider).time;
    List<File> _snacks = ref.watch(floggingInfoControllerProvider).trabSnacks;
    bool _isFlogging = ref.watch(floggingInfoControllerProvider).isFlogging;
    double _distance = ref.watch(floggingInfoControllerProvider).distance;
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
              right: 240.w,
              top: 0,
              child: Transform(
                transform: Matrix4.rotationZ(-30 * pi / 180),
                alignment: Alignment.center,
                child: CustomNetworkImage(
                  imageUrl: AppGifs.runTrab,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                floggingTimerInfos(
                  snack: _snacks.length.toString(),
                  calorie: "0",
                  time: _time,
                  distance: _distance.toStringAsFixed(2),
                  type: InfoType.timer,
                ),
                SizedBox(
                  height: 300.h,
                ),
                timerBottomButtons(
                  context: context,
                  isFlogging: _isFlogging,
                  onPressedStartButton: ref
                      .read(floggingInfoControllerProvider.notifier)
                      .startTimer,
                  onPressedCameraButton: () async => await ref
                      .read(floggingInfoControllerProvider.notifier)
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

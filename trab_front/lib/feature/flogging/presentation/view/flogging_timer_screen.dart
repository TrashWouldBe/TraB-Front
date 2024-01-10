import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_info_view_model.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/map_screen_view_model.dart';
import 'package:trab_front/feature/flogging/presentation/widget/flogging_timer_infos.dart';
import 'package:trab_front/feature/flogging/presentation/widget/timer_bottom_buttons.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
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
      ref.read(mapScreenControllerProvider.notifier).getCurrentLocation();
      ref.read(floggingInfoControllerProvider.notifier).startTimer();
      print("여기");
    });
  }

  @override
  Widget build(BuildContext context) {
    String _time = ref.watch(floggingInfoControllerProvider).time;
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
            Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                floggingTimerInfos(
                    snack: "0", calorie: "0", time: _time, distance: "0.00"),
                SizedBox(
                  height: 300.h,
                ),
                timerBottomButtons(context: context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

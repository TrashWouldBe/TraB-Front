import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/common/widget/button.dart';
import 'package:trab_front/helpers/constants/app_images.dart';

Widget timerBottomButtons(
    {required BuildContext context,
    required bool isFlogging,
    required onPressedStartButton}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      noPaddingButton(
          child: Image.asset(
            isFlogging ? AppImages.stopButton : AppImages.restartbutton,
            width: 79.w,
            height: 79.h,
          ),
          onPressed: () {
            isFlogging
                ? AppRouter.pushNamed(Routes.FloggingStopScreenRoute)
                : onPressedStartButton();
          }),
      SizedBox(
        width: 110.w,
      ),
      Image.asset(
        AppImages.cameraButton,
        width: 79.w,
        height: 79.h,
      ),
    ],
  );
}

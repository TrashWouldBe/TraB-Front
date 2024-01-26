import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/helpers/constants/app_images.dart';

Widget timerBottomButtons(
    {required BuildContext context,
    required bool isPlogging,
    required onPressedStartButton,
    required onPressedCameraButton}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      noPaddingButton(
          child: Image.asset(
            isPlogging ? AppImages.stopButton : AppImages.restartbutton,
            width: 79.w,
            height: 79.h,
          ),
          onPressed: () {
            isPlogging
                ? AppRouter.pushNamed(Routes.PloggingStopScreenRoute)
                : onPressedStartButton();
          }),
      SizedBox(
        width: 110.w,
      ),
      noPaddingButton(
          child: Image.asset(
            AppImages.cameraButton,
            width: 79.w,
            height: 79.h,
          ),
          onPressed: onPressedCameraButton),
    ],
  );
}

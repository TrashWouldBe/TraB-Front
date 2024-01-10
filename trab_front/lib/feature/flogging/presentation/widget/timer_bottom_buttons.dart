import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/common/widget/button.dart';

Widget timerBottomButtons({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      noPaddingButton(
          child: Image.asset(
            "assets/images/stop_button.png",
            width: 79.w,
            height: 79.h,
          ),
          onPressed: () {
            AppRouter.pushNamed(Routes.FloggingStopScreenRoute);
          }),
      SizedBox(
        width: 110.w,
      ),
      Image.asset(
        "assets/images/camera_button.png",
        width: 79.w,
        height: 79.h,
      ),
    ],
  );
}

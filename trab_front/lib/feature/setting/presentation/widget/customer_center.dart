import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/setting/presentation/widget/right_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

//TODO: onPress Event
Widget customerCenter() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text(
          "고객 센터",
          style: AppTypography.mainCaption_1
              .copyWith(color: AppColors.textColor_2),
        ),
      ),
      SizedBox(
        height: 25.h,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: SizedBox(
          height: 22.h,
          child: rightButton(text: "이용방법"),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: SizedBox(
          height: 22.h,
          child: rightButton(text: "1:1 문의"),
        ),
      ),
      SizedBox(
        height: 22.h,
        child: rightButton(text: "이용약관"),
      ),
      SizedBox(
        height: 30.h,
      ),
    ],
  );
}

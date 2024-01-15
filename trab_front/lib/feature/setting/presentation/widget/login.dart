import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/setting/presentation/widget/right_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

Widget login({required onPressedSignOut, required onPressedWithdrawal}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text(
          AppStrings.logIn,
          style: AppTypography.mainCaption_1
              .copyWith(color: AppColors.textColor_2),
        ),
      ),
      SizedBox(
        height: 14.h,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: SizedBox(
          height: 22.h,
          child:
              rightButton(text: AppStrings.logOut, onPressed: onPressedSignOut),
        ),
      ),
      SizedBox(
        height: 22.h,
        child: rightButton(
            text: AppStrings.withdrawal, onPressed: onPressedWithdrawal),
      ),
    ],
  );
}

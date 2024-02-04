import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/setting/presentation/widget/right_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

//TODO: onPress Event
Widget customerCenter(
    {required Function() onPressedMethod,
    required Function() onPressedInvidualQuery,
    required Function() onPressedTermsOfUse}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text(
          AppStrings.customerCenter,
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
          child:
              rightButton(text: AppStrings.method, onPressed: onPressedMethod),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: SizedBox(
          height: 22.h,
          child: rightButton(
              text: AppStrings.invidualQuery,
              onPressed: onPressedInvidualQuery),
        ),
      ),
      SizedBox(
        height: 22.h,
        child: rightButton(
            text: AppStrings.termsOfUse, onPressed: onPressedTermsOfUse),
      ),
      SizedBox(
        height: 30.h,
      ),
    ],
  );
}

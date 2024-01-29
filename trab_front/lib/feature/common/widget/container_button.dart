import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

/*
  size: S,L
*/
Widget containerButton(
    {required String title,
    onPressed,
    size = "L",
    textColor = AppColors.body1,
    backgroundColor = AppColors.accentColor}) {
  return noPaddingButton(
    child: Container(
      width: 339.w,
      height: 52.h,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: size == "S"
              ? AppTypography.mainCaption_3.copyWith(color: textColor)
              : AppTypography.body_5.copyWith(color: textColor),
        ),
      ),
    ),
    onPressed: onPressed,
  );
}

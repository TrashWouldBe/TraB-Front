import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget containerButton({required String title, onPressed}) {
  return noPaddingButton(
    child: Container(
      width: 339.w,
      height: 52.h,
      decoration: ShapeDecoration(
        color: AppColors.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTypography.body_5.copyWith(color: AppColors.body1),
        ),
      ),
    ),
    onPressed: onPressed,
  );
}

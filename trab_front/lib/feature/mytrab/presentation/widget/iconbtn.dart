import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Column myTrabIconBtn(
    {required String text, required String icon, required VoidCallback onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        text,
        style: AppTypography.iconTxt.copyWith(color: AppColors.body1),
      ),
      SizedBox(
        height: 4.h,
      ),
      GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            icon,
            width: 51.w,
            height: 51.w,
          ))
    ],
  );
}

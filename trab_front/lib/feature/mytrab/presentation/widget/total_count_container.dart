import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Container totalCountContainer({
  required int totalCount,
  required Color backgroundColor,
  required Color textColor,
}) {
  return Container(
    width: 339.w,
    height: 52.h,
    margin: EdgeInsets.only(top: 12.h, bottom: 8.h),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: backgroundColor
    ),
    child: Text(
      "지금까지 내가 주운 트래비 간식: $totalCount개",
      style: AppTypography.mainCaption_1.copyWith(
        color: textColor
      ),
    ),
  );
}
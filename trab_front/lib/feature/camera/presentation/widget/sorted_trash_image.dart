import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget sortedTrashImage({required File image, required String text}) {
  return Center(
    child: Stack(
      children: [
        Container(
          width: 238.w,
          height: 374.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16.h,
          left: 0.w,
          right: 0.w,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: ShapeDecoration(
                color: AppColors.accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                text,
                style: AppTypography.body_5.copyWith(color: AppColors.body1),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

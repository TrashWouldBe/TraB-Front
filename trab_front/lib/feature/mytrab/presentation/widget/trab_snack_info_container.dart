import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget trabSnackInfoContainer(
    {required int plasticAmount,
    required int vinylAmount,
    required int canAmount,
    required int wasteAmount,
    required int styrofoamAmount,
    required int glassAmount,
    required int foodAmount,
    required int paperAmount}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            eachItemContainer(plasticAmount, AppSvgs.plasticStroke),
            eachItemContainer(vinylAmount, AppSvgs.vinylStroke),
            eachItemContainer(canAmount, AppSvgs.canStroke),
            eachItemContainer(wasteAmount, AppSvgs.wasteStroke),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            eachItemContainer(styrofoamAmount, AppSvgs.styrofoamStroke),
            eachItemContainer(glassAmount, AppSvgs.glassStroke),
            eachItemContainer(foodAmount, AppSvgs.foodStroke),
            eachItemContainer(paperAmount, AppSvgs.paperStroke),
          ],
        ),
      ],
    ),
  );
}

Container eachItemContainer(int amount, String svg) {
  return Container(
    width: 69.w,
    height: 39.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.primaryColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          svg,
          width: 20.w,
          height: 20.w,
          fit: BoxFit.scaleDown,
        ),
        Text(
          amount.toString(),
          style: AppTypography.body
              .copyWith(fontWeight: FontWeight.w400, color: AppColors.body1),
        ),
      ],
    ),
  );
}

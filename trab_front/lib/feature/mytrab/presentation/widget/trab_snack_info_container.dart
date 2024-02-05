import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget trabSnackInfoContainer({required TrabSnackModel? trabSnackModel}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            eachItemContainer(
                trabSnackModel?.plastic ?? 0, AppSvgs.plasticStroke),
            eachItemContainer(trabSnackModel?.vinyl ?? 0, AppSvgs.vinylStroke),
            eachItemContainer(trabSnackModel?.can ?? 0, AppSvgs.canStroke),
            eachItemContainer(
                trabSnackModel?.general ?? 0, AppSvgs.generalStroke),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            eachItemContainer(
                trabSnackModel?.styrofoam ?? 0, AppSvgs.styrofoamStroke),
            eachItemContainer(trabSnackModel?.glass ?? 0, AppSvgs.glassStroke),
            eachItemContainer(trabSnackModel?.food ?? 0, AppSvgs.foodStroke),
            eachItemContainer(trabSnackModel?.paper ?? 0, AppSvgs.paperStroke),
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

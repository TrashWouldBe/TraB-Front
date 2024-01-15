import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget floggingRecordContainer() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: Container(
      width: 360.w,
      height: 116.h,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.bgColor_2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 22.h,
                child: Text(
                  "DECEMBER 23, 2023",
                  style: AppTypography.mainSubtitle
                      .copyWith(color: AppColors.grey2),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 22.h,
                child: Text(
                  "마장동 트래비 간식사냥",
                  style: AppTypography.subTitle_1
                      .copyWith(color: AppColors.textColor_1),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 22.h,
                    child: Text(
                      "0.00 km",
                      style:
                          AppTypography.body.copyWith(color: AppColors.grey2),
                    ),
                  ),
                  SizedBox(
                    width: 54.w,
                  ),
                  SizedBox(
                    height: 22.h,
                    child: Text(
                      "0 간식",
                      style:
                          AppTypography.body.copyWith(color: AppColors.grey2),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 57.w,
          ),
          Image.asset(
            AppImages.amazedTrab,
            width: 63.w,
            height: 77.h,
          ),
        ],
      ),
    ),
  );
}

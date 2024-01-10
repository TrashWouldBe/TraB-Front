import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/dateTime_extension.dart';

Widget trabModalInfos({
  required snack,
  required calorie,
  required time,
  required distance,
  required onPressedStartButton,
}) {
  return SizedBox(
    height: 422.h,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            DateTime.now().getCurrentDateFormatted(),
            style:
                AppTypography.subTitle_1.copyWith(color: AppColors.textColor_1),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 92.w,
                  child: Column(
                    children: [
                      Text(
                        snack,
                        textAlign: TextAlign.center,
                        style: AppTypography.body
                            .copyWith(color: AppColors.textColor_2),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        AppStrings.trabSnack,
                        textAlign: TextAlign.center,
                        style: AppTypography.body_3
                            .copyWith(color: AppColors.textColor_2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 35.w,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 99.w,
                  child: Column(
                    children: [
                      Text(
                        calorie,
                        textAlign: TextAlign.center,
                        style: AppTypography.body
                            .copyWith(color: AppColors.textColor_2),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        AppStrings.calorie,
                        textAlign: TextAlign.center,
                        style: AppTypography.body_3
                            .copyWith(color: AppColors.textColor_2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 35.w,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 99.w,
                  child: Column(
                    children: [
                      Text(
                        time,
                        textAlign: TextAlign.center,
                        style: AppTypography.body
                            .copyWith(color: AppColors.textColor_2),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        AppStrings.time,
                        textAlign: TextAlign.center,
                        style: AppTypography.body_3
                            .copyWith(color: AppColors.textColor_2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(height: 2.h, color: AppColors.grey1),
          SizedBox(
            height: 10.h,
          ),
          Text(
            distance,
            style: AppTypography.headline_2.copyWith(
              color: AppColors.textColor_2,
              height: 0.h,
            ),
          ),
          Text(
            AppStrings.kiloMeter,
            style: AppTypography.headline_2_1.copyWith(
              color: AppColors.textColor_2,
              height: 0.h,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.stopButton,
                width: 63.w,
                height: 63.h,
              ),
              SizedBox(
                width: 160.w,
              ),
              noPaddingButton(
                child: Image.asset(
                  AppImages.restartbutton,
                  width: 63.w,
                  height: 63.h,
                ),
                onPressed: onPressedStartButton,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

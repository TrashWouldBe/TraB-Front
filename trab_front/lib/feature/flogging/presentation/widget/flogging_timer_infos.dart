import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/dateTime_extension.dart';

Widget floggingTimerInfos({
  required snack,
  required calorie,
  required time,
  required distance,
}) {
  return Column(
    children: [
      Text(
        DateTime.now().getCurrentDateFormatted(),
        style: AppTypography.subTitle_1.copyWith(color: AppColors.body1),
      ),
      SizedBox(
        height: 20.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 99.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 99.w,
                      child: Text(
                        snack,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            AppTypography.body.copyWith(color: AppColors.body1),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 99.w,
                      child: Text(
                        AppStrings.trabSnack,
                        textAlign: TextAlign.center,
                        style: AppTypography.body_3
                            .copyWith(color: AppColors.body1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    width: 99.w,
                    child: Text(
                      calorie,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTypography.body.copyWith(color: AppColors.body1),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 99.w,
                    child: Text(
                      AppStrings.calorie,
                      textAlign: TextAlign.center,
                      style:
                          AppTypography.body_3.copyWith(color: AppColors.body1),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    width: 99.w,
                    child: Text(
                      time,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppTypography.body.copyWith(color: AppColors.body1),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 99.w,
                    child: Text(
                      AppStrings.time,
                      textAlign: TextAlign.center,
                      style:
                          AppTypography.body_3.copyWith(color: AppColors.body1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        distance,
        style: AppTypography.headline_1.copyWith(
          color: AppColors.body1,
          height: 0.h,
        ),
      ),
      Text(
        AppStrings.kiloMeter,
        style: AppTypography.headline_1_2.copyWith(
          color: AppColors.body1,
          height: 0.h,
        ),
      ),
    ],
  );
}

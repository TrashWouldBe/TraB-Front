import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/flogging/presentation/types.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/datetime_extension.dart';

Widget floggingTimerInfos({
  required snack,
  required calorie,
  required time,
  required distance,
  required InfoType type,
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
        child: floggingInfo(
          calorie: calorie,
          snack: snack,
          time: time,
          type: type,
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

Widget floggingInfo({
  required snack,
  required calorie,
  required time,
  required InfoType type,
}) {
  return Row(
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
                  style: type == InfoType.timer
                      ? AppTypography.body.copyWith(color: AppColors.body1)
                      : AppTypography.body_2
                          .copyWith(color: AppColors.textColor_2),
                ),
              ),
              SizedBox(
                height: type == InfoType.timer ? 10.h : 0.h,
              ),
              SizedBox(
                width: 99.w,
                child: Text(
                  AppStrings.trabSnack,
                  textAlign: TextAlign.center,
                  style: type == InfoType.timer
                      ? AppTypography.body_3.copyWith(color: AppColors.body1)
                      : AppTypography.body_3
                          .copyWith(color: AppColors.textColor_2),
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
                style: type == InfoType.timer
                    ? AppTypography.body.copyWith(color: AppColors.body1)
                    : AppTypography.body_2
                        .copyWith(color: AppColors.textColor_2),
              ),
            ),
            SizedBox(
              height: type == InfoType.timer ? 10.h : 0.h,
            ),
            SizedBox(
              width: 99.w,
              child: Text(
                AppStrings.calorie,
                textAlign: TextAlign.center,
                style: type == InfoType.timer
                    ? AppTypography.body_3.copyWith(color: AppColors.body1)
                    : AppTypography.body_3
                        .copyWith(color: AppColors.textColor_2),
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
                style: type == InfoType.timer
                    ? AppTypography.body.copyWith(color: AppColors.body1)
                    : AppTypography.body_2
                        .copyWith(color: AppColors.textColor_2),
              ),
            ),
            SizedBox(
              height: type == InfoType.timer ? 10.h : 0.h,
            ),
            SizedBox(
              width: 99.w,
              child: Text(
                AppStrings.time,
                textAlign: TextAlign.center,
                style: type == InfoType.timer
                    ? AppTypography.body_3.copyWith(color: AppColors.body1)
                    : AppTypography.body_3
                        .copyWith(color: AppColors.textColor_2),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget floggingEndInfo({
  required String snack,
  required String calorie,
  required String time,
  required String distance,
  required InfoType type,
}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            distance,
            style: AppTypography.headline_2.copyWith(
              color: AppColors.textColor_2,
              letterSpacing: -0.41,
              height: 1.1.h,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            "km",
            style: AppTypography.headline_2_1
                .copyWith(color: AppColors.textColor_2),
          ),
        ],
      ),
      floggingInfo(snack: snack, calorie: "0", time: time, type: InfoType.end),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}

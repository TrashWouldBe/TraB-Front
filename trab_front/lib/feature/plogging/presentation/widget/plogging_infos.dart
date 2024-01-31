import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/plogging/presentation/types.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/datetime_extension.dart';

Widget ploggingTimerInfos({
  required PloggingInfo ploggingInfo,
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
        child: ploggingInfoWidget(
          ploggingInfo: ploggingInfo,
          type: type,
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        ploggingInfo.runRange.toStringAsFixed(2),
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

Widget ploggingInfoWidget({
  required PloggingInfo ploggingInfo,
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
                  ploggingInfo.images.length.toString(),
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
                ploggingInfo.calorie.toString(),
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
                ploggingInfo.runTime,
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

Widget ploggingEndInfo({
  required PloggingInfo ploggingInfo,
  required InfoType type,
}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            ploggingInfo.runRange.toStringAsFixed(2),
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
            AppStrings.kiloMeter,
            style: AppTypography.headline_2_1
                .copyWith(color: AppColors.textColor_2),
          ),
        ],
      ),
      ploggingInfoWidget(ploggingInfo: ploggingInfo, type: InfoType.end),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}

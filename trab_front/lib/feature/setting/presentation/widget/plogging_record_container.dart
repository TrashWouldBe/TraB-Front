import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/plogging/data/model/plogging_model.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

Widget ploggingRecordContainer({required PloggingModel plogging}) {
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
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 27.h,
                  child: Text(
                    plogging.runDate.toUpperCase(),
                    style: AppTypography.mainSubtitle
                        .copyWith(color: AppColors.grey2),
                  ),
                ),
                SizedBox(
                  width: 180.w,
                  height: 32.h,
                  child: Text(
                    plogging.runName,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.subTitle_1
                        .copyWith(color: AppColors.textColor_1),
                  ),
                ),
                Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 22.h,
                        minHeight: 22.h,
                        maxWidth: 60.w,
                      ),
                      child: Text(
                        plogging.runRange.toStringAsFixed(2),
                        overflow: TextOverflow.ellipsis,
                        style:
                            AppTypography.body.copyWith(color: AppColors.grey2),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                      child: Text(
                        AppStrings.kiloMeter,
                        style:
                            AppTypography.body.copyWith(color: AppColors.grey2),
                      ),
                    ),
                    const Spacer(),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 24.h,
                        minHeight: 24.h,
                        maxWidth: 65.w,
                      ),
                      child: Text(
                        "${plogging.trabSnack} ",
                        overflow: TextOverflow.ellipsis,
                        style:
                            AppTypography.body.copyWith(color: AppColors.grey2),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                      child: Text(
                        AppStrings.snack,
                        style:
                            AppTypography.body.copyWith(color: AppColors.grey2),
                      ),
                    ),
                  ],
                )
              ],
            ),
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

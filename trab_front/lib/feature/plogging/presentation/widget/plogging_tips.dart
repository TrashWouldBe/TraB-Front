import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget ploggingExplainContiner({required String title, required String body}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 41.w),
    child: Card(
      elevation: 3.h,
      surfaceTintColor: AppColors.body1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0.r),
      ),
      child: SizedBox(
        width: 302.w,
        height: 111.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppSvgs.plogging,
              width: 52.w,
              height: 52.h,
              color: AppColors.subColor,
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.mainCaption_1.copyWith(
                    color: AppColors.textColor_1,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  body,
                  style: AppTypography.mainCaption_2.copyWith(
                    height: 1.2.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

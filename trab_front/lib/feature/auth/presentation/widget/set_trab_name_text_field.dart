import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

Widget setTrabNameTextField({required focusNode}) {
  return Container(
    width: 270.w,
    height: 42.h,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 3.w, color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(30.r),
      ),
      shadows: focusNode.hasFocus
          ? [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 11.r,
                offset: Offset(0.w, 5.r),
              ),
            ]
          : [],
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 20.w, right: 5.w, top: 3.h),
      child: TextField(
        focusNode: focusNode,
        style:
            AppTypography.mainCaption_2.copyWith(color: AppColors.textColor_2),
        decoration: InputDecoration(
          hintText: AppStrings.pleaseInputLeastTwo,
          hintStyle:
              AppTypography.mainCaption_2.copyWith(color: AppColors.grey1),
          border: InputBorder.none,
          suffixIcon: SvgPicture.asset(
            AppSvgs.edit,
            color: AppColors.grey1,
          ),
          suffixIconConstraints:
              BoxConstraints(maxWidth: 24.w, maxHeight: 24.h),
        ),
      ),
    ),
  );
}

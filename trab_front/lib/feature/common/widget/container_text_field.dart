import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget containerTextField({
  String hintText = "홍길동",
  FocusNode? focusNode,
  TextInputType keyboardType = TextInputType.text,
  required TextEditingController textEditingController,
}) {
  return Container(
    width: 305.w,
    height: 50.h,
    alignment: Alignment.center,
    decoration: ShapeDecoration(
      color: AppColors.greenGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      shadows: focusNode != null && focusNode.hasFocus
          ? [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 11.r,
                offset: Offset(0.w, 5.r),
              ),
            ]
          : [],
    ),
    child: TextField(
      controller: textEditingController,
      style: AppTypography.caption_2.copyWith(color: AppColors.textColor_2),
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        hintText: hintText,
        hintStyle: AppTypography.caption_2.copyWith(color: AppColors.grey2),
        contentPadding: EdgeInsets.only(
          left: 20.w,
          bottom: 5.h,
        ),
      ),
      keyboardType: keyboardType,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/datetime_extension.dart';

Widget ploggingEndTextField({
  required TextEditingController textEditingController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        DateTime.now().getCurrentDateFormatted(),
        style: AppTypography.subTitle_1.copyWith(color: AppColors.textColor_1),
      ),
      TextField(
        controller: textEditingController,
        style: AppTypography.body.copyWith(color: AppColors.textColor_2),
        decoration: InputDecoration(
          hintText: AppStrings.examplePlogging,
          hintStyle: AppTypography.body.copyWith(color: AppColors.grey1),
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SvgPicture.asset(
              AppSvgs.edit,
              color: AppColors.grey1,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey1),
          ),
          suffixIconConstraints:
              BoxConstraints(maxWidth: 60.w, maxHeight: 60.h),
        ),
      ),
    ],
  );
}

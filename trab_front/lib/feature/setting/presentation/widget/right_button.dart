import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/feature/common/widget/button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget rightButton({required String text, onPressed}) {
  return noPaddingButton(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Text(text,
              style: AppTypography.mainSubtitle
                  .copyWith(color: AppColors.textColor_1)),
          const Spacer(),
          SvgPicture.asset(
            AppSvgs.rightCursor,
            color: AppColors.grey2,
          ),
        ],
      ),
    ),
    onPressed: onPressed,
  );
}

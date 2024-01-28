import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

SizedBox houseNameWidget({required TextEditingController controller}) {
  return SizedBox(
    width: 390.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 36.76.h,
          padding: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.body1,
              border: Border.all(color: AppColors.primaryColor, width: 2.0),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    color: const Color(0xFF2B2B2B).withOpacity(0.1),
                    blurRadius: 2.0),
                BoxShadow(
                    offset: const Offset(0, 3),
                    color: const Color(0xFF2B2B2B).withOpacity(0.09),
                    blurRadius: 3.0)
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 160.w, minWidth: 20.w),
                child: IntrinsicWidth(
                  child: TextField(
                    controller: controller,
                    onTapOutside: (_) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 18.h, top: 18.h),
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 2.w),
                        child: SvgPicture.asset(
                          AppSvgs.penIcon,
                          width: 10.w,
                        ),
                      ),
                    ),
                    style: AppTypography.mainCaption_2.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Text(
                AppStrings.trabHouseT,
                style: AppTypography.mainCaption_2
                    .copyWith(fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

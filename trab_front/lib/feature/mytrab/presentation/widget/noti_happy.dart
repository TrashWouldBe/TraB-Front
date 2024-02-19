import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class NotiHappy extends StatelessWidget {
  const NotiHappy({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      content: IntrinsicHeight(
        child: Container(
          width: 329.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: AppColors.body1),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(AppSvgs.xmark),
                ),
              ),
              SizedBox(
                width: 329.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvgs.trab,
                      width: 27.w,
                      color: const Color(0xFF49AF59),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: 329.w,
                      alignment: Alignment.center,
                      child: Text(
                        "가구가 생겨서 너무 행복해요. 고마워요!",
                        style: AppTypography.mainCaption_1
                            .copyWith(color: AppColors.textColor_2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

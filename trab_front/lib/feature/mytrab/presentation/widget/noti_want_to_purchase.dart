import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class NotiWantToPurchase extends StatelessWidget {
  const NotiWantToPurchase({
    super.key,
    required this.svg,
    required this.onTap,
  });
  final String svg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      content: IntrinsicHeight(
        child: Container(
          width: 329.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.body1,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(AppSvgs.xmark),
                  ),
                ],
              ),
              SvgPicture.asset(
                svg,
                width: 261.79.w,
                height: 221.66.h,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 46.53.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: AppColors.accentColor),
                  child: Text(
                    "간식으로 가구 구매하기",
                    style: AppTypography.mainCaption_1
                        .copyWith(color: AppColors.body1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

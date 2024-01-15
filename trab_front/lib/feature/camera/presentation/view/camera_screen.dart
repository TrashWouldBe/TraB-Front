import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CameraScreenState();
  }
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppSvgs.camera,
              color: AppColors.primaryColor,
              width: 46.w,
              height: 46.h,
            ),
            SizedBox(
              height: 13.h,
            ),
            Text(
              AppStrings.cameraExpain,
              style:
                  AppTypography.body_5.copyWith(color: AppColors.textColor_1),
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: 339.w,
              height: 52.h,
              decoration: ShapeDecoration(
                color: AppColors.accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              child: Center(
                child: Text(
                  AppStrings.goToSnackPhoto,
                  style: AppTypography.body_5.copyWith(color: AppColors.body1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

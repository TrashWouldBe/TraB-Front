import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/feature/common/widget/image.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

//TODO: userInfo
Widget upperView(
    {required String name, required String? image, required onPressedImage}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 24.w,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 18.h,
        ),
        Text(
          AppStrings.myPage,
          style:
              AppTypography.headline_3.copyWith(color: AppColors.textColor_2),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 60.w,
              height: 60.h,
              child: Stack(
                children: [
                  noPaddingButton(
                    onPressed: onPressedImage,
                    child: Container(
                        alignment: Alignment.center,
                        width: 57.w,
                        height: 57.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3.w, color: AppColors.primaryColor),
                        ),
                        child: image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(57.r),
                                child: CustomNetworkImage(
                                  imageUrl: image,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.asset(
                                AppImages.trab,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              )),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      decoration: const BoxDecoration(
                        color: AppColors.grey1,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppSvgs.camera_1,
                          width: 15.w,
                          height: 13.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 19.w,
            ),
            Text(
              name,
              style: AppTypography.subTitle_1.copyWith(color: AppColors.grey1),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              AppStrings.owner,
              style: AppTypography.subTitle_1
                  .copyWith(color: AppColors.textColor_2),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    ),
  );
}

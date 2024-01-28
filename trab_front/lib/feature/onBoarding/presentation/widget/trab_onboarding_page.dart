import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/feature/common/widget/page_indicator.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget trabOnboardingPage({required int selectedPage}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    child: Padding(
      padding: EdgeInsets.only(
        left: 47.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45.h,
          ),
          selectedPage == 0
              ? Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '작은 발걸음을 모아,\n',
                        style: AppTypography.onBoarding_head_1.copyWith(
                          height: 1.h,
                        ),
                      ),
                      TextSpan(
                        text: '지속가능한 ',
                        style: AppTypography.onBoarding_head_1
                            .copyWith(color: AppColors.textColor_1),
                      ),
                      TextSpan(
                        text: '걸음으로! ',
                        style: AppTypography.onBoarding_head_1,
                      ),
                    ],
                  ),
                )
              : Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '찰캌! ',
                        style: AppTypography.onBoarding_head_1.copyWith(
                          height: 1.h,
                          color: AppColors.textColor_1,
                        ),
                      ),
                      TextSpan(
                        text: '한번으로\n',
                        style: AppTypography.onBoarding_head_1.copyWith(
                          height: 1.h,
                        ),
                      ),
                      TextSpan(
                        text: '쓰레기를 분류해요.',
                        style: AppTypography.onBoarding_head_1,
                      ),
                    ],
                  ),
                ),
          SizedBox(
            height: 14.h,
          ),
          selectedPage == 0
              ? Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '플로깅 기록부터 쓰레기 배출까지, ',
                        style: AppTypography.mainCaption_2,
                      ),
                      TextSpan(
                        text: '트래비와 함께해요.',
                        style: AppTypography.mainCaption_2
                            .copyWith(color: AppColors.textColor_2),
                      ),
                    ],
                  ),
                )
              : Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '어렵게만 느껴졌던 쓰레기 분류, ',
                        style: AppTypography.mainCaption_2,
                      ),
                      TextSpan(
                        text: '트래비가 도와줄게요!',
                        style: AppTypography.mainCaption_2
                            .copyWith(color: AppColors.textColor_2),
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: EdgeInsets.only(left: 104.w, top: 66.h),
            child: SvgPicture.asset(AppSvgs.onBoardingTrab),
          ),
          SizedBox(
            height: 71.h,
          ),
          Center(
            child: pageIndicator(selectedPage: selectedPage, itemCount: 3),
          ),
        ],
      ),
    ),
  );
}

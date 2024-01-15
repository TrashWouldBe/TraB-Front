import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class FloggingEndScreen extends ConsumerStatefulWidget {
  const FloggingEndScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FloggingEndScreenState();
  }
}

class _FloggingEndScreenState extends ConsumerState<FloggingEndScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppColors.subColor,
          appBar: AppBar(
            backgroundColor: AppColors.subColor,
            toolbarHeight: 30.h,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            leadingWidth: double.infinity,
            leading: Padding(
              padding: EdgeInsets.only(left: 28.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/left_arrow.svg',
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  Text(
                    "오늘도 트래비와 함께!",
                    style: AppTypography.headline_3
                        .copyWith(color: AppColors.body1),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 63.h),
            child: Container(
              width: 390,
              decoration: ShapeDecoration(
                color: AppColors.body1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      "DECEMBER 23, 2023",
                      style: AppTypography.subTitle_1
                          .copyWith(color: AppColors.textColor_1),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: SvgPicture.asset(
                          'assets/svgs/edit.svg',
                          color: AppColors.grey1,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey1),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(maxWidth: 24.w, maxHeight: 24.h),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

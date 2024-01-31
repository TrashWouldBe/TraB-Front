import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/auth/presentation/viewmodel/login_screen_view_model.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LogInScreenState();
  }
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 270.h,
                  ),
                  Image.asset(
                    'assets/images/trab_logo.png',
                    width: 258.w,
                    height: 102.h,
                  ),
                  SizedBox(
                    height: 58.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28.w,
                        height: 1.h,
                        color: AppColors.grey2,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "소셜 로그인 이용하기",
                        style: AppTypography.caption,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        width: 28.w,
                        height: 1.h,
                        color: AppColors.grey2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  noPaddingButton(
                    child: Image.asset(
                      AppImages.kakaoLogin,
                      width: 183.w,
                      height: 45.h,
                    ),
                    onPressed: ref
                        .read(loginScreenControllerProvider.notifier)
                        .socialSignInWithKakao,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  noPaddingButton(
                    child: Image.asset(
                      AppImages.googleLogin,
                      width: 183.w,
                      height: 45.h,
                    ),
                    onPressed: ref
                        .read(loginScreenControllerProvider.notifier)
                        .socialSignInWithGoogle,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  noPaddingButton(
                    child: Image.asset(
                      AppImages.appleLogin,
                      width: 183.w,
                      height: 45.h,
                    ),
                    onPressed: ref
                        .read(loginScreenControllerProvider.notifier)
                        .socialSignInWithApple,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

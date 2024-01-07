import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/domain/auth_domain.dart';
import 'package:trab_front/feature/presentation/viewmodel/login_view_model.dart';
import 'package:trab_front/feature/presentation/widget/common/button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
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
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 400.h,
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
                        style: AppTypography.captions.caption,
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
                    height: 20.h,
                  ),
                  noPaddingTextButton(
                    child: Image.asset(
                      "assets/images/kakao_login.png",
                      width: 183.w,
                      height: 45.h,
                    ),
                    onPressed: () => ref
                        .read(loginViewControllerProvider.notifier)
                        .signInWithKakao(context: context),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Image.asset(
                    "assets/images/google_login.png",
                    width: 183.w,
                    height: 45.h,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Image.asset(
                    "assets/images/apple_login.png",
                    width: 183.w,
                    height: 45.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

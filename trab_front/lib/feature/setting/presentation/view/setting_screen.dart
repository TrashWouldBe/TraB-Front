import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/auth/domain/auth_domain.dart';
import 'package:trab_front/feature/setting/presentation/widget/customer_center.dart';
import 'package:trab_front/feature/setting/presentation/widget/login.dart';
import 'package:trab_front/feature/setting/presentation/widget/upper_view.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SettingScreenState();
  }
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperView(name: "마이 트래비", image: "ㅇㅁㄴ"),
          Divider(
            color: AppColors.greenGrey2,
            thickness: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
            child: Text(
              "플로깅 기록",
              style: AppTypography.mainCaption_1
                  .copyWith(color: AppColors.textColor_2),
            ),
          ),
          customerCenter(),
          login(
              onPressedSignOut:
                  ref.read(authControllerProvider.notifier).signOut,
              onPressedWithdrawal:
                  ref.read(authControllerProvider.notifier).withdrawal),
        ],
      ),
    );
  }
}

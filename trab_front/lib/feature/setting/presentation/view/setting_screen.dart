import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/auth/domain/auth_domain.dart';
import 'package:trab_front/feature/auth/domain/user_domain.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/feature/setting/presentation/viewmodel/setting_screen_view_model.dart';
import 'package:trab_front/feature/setting/presentation/widget/customer_center.dart';
import 'package:trab_front/feature/setting/presentation/widget/login.dart';
import 'package:trab_front/feature/setting/presentation/widget/upper_view.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SettingScreenState();
  }
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(userControllerProvider.notifier).getUserInfo();
      });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperView(name: AppStrings.myTrab, image: "ㅇㅁㄴ"),
          Divider(
            color: AppColors.greenGrey2,
            thickness: 5.h,
          ),
          noPaddingButton(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
              child: Text(
                AppStrings.floggingRecord,
                style: AppTypography.mainCaption_1
                    .copyWith(color: AppColors.textColor_2),
              ),
            ),
            onPressed: ref
                .read(settingScreenControllerProvider.notifier)
                .handleTapFlogginRecord,
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

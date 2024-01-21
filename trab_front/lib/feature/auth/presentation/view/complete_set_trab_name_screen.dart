import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/feature/auth/presentation/viewmodel/set_trab_name_view_model.dart';
import 'package:trab_front/feature/auth/presentation/widget/set_trab_name_text_field.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class CompleteSetTrabNameScreen extends ConsumerStatefulWidget {
  const CompleteSetTrabNameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CompleteSetTrabNameScreenState();
  }
}

class _CompleteSetTrabNameScreenState
    extends ConsumerState<CompleteSetTrabNameScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(setTrabNameScreenControllerProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    var focusNode = ref.watch(setTrabNameScreenControllerProvider).focusNode;
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 300.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(AppImages.nameSettingCompleteBackggound),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

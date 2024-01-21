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

class SetTrabNameScreen extends ConsumerStatefulWidget {
  const SetTrabNameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SetTrabNameScreenState();
  }
}

class _SetTrabNameScreenState extends ConsumerState<SetTrabNameScreen> {
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
                Image.asset(AppImages.setTrabNameBackground),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 62.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 240.h,
                      ),
                      SvgPicture.asset(AppSvgs.trabReverse,
                          color: AppColors.primaryColor),
                      SizedBox(
                        height: 9.h,
                      ),
                      Text(
                        AppStrings.pleaseSetTrabName,
                        style: AppTypography.body_5
                            .copyWith(color: AppColors.textColor_2),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      setTrabNameTextField(focusNode: focusNode),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/complete_set_trab_name_screen_view_model.dart';
import 'package:trab_front/feature/auth/presentation/widget/complete_set_trab_image_widget.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
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
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
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
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 103.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 15.w,
                              height: 15.h,
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            Text(AppStrings.nameToMe,
                                style: AppTypography.body_5),
                            SizedBox(
                              height: 27.h,
                            ),
                          ],
                        ),
                      ),
                      trabContainer(),
                      SizedBox(
                        height: 31.h,
                      ),
                      containerButton(
                        title: AppStrings.withYouForever,
                        onPressed: ref
                            .read(completeSetTrabNameScreenControllerProvider
                                .notifier)
                            .handlePressedContainerButton,
                      ),
                    ],
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

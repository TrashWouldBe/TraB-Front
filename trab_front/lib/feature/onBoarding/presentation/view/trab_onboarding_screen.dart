import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trab_front/feature/auth/presentation/viewmodel/set_trab_name_view_model.dart';

import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/common/widget/page_indicator.dart';
import 'package:trab_front/feature/onBoarding/presentation/viewmodel/trab_onboarding_screen_view_model.dart';
import 'package:trab_front/feature/onBoarding/presentation/widget/trab_onboarding_page.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class TrabOnBoardingScreen extends ConsumerStatefulWidget {
  const TrabOnBoardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TrabOnBoardingScreenState();
  }
}

class _TrabOnBoardingScreenState extends ConsumerState<TrabOnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(setTrabNameScreenControllerProvider.notifier).init();
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex =
        ref.watch(trabOnBoardingScreenControllerProvider).selectedIndex;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          canPop: false,
          canPush: true,
          backgroundColor: AppColors.backgroundColor,
          trailingColor: AppColors.grey1,
          onPressedTrailing: ref
              .read(trabOnBoardingScreenControllerProvider.notifier)
              .handlePressedTrailing,
        ),
        body: SafeArea(
          child: PageView.builder(
            itemCount: 3,
            controller: pageController,
            itemBuilder: (context, index) {
              return trabOnboardingPage(
                  selectedPage: pageController.page!.round());
            },
            onPageChanged: ref
                .read(trabOnBoardingScreenControllerProvider.notifier)
                .handlePageChanged,
          ),
        ),
      ),
    );
  }
}

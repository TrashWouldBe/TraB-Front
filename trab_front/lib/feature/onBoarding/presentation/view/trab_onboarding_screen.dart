import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/onBoarding/presentation/viewmodel/trab_onboarding_screen_view_model.dart';
import 'package:trab_front/feature/onBoarding/presentation/widget/trab_onboarding_pages.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';

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
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(trabOnBoardingScreenControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        ref.watch(trabOnBoardingScreenControllerProvider).selectedPage;
    PageController pageController =
        ref.watch(trabOnBoardingScreenControllerProvider).pageController;
    List<FocusNode> focusNodes =
        ref.watch(trabOnBoardingScreenControllerProvider).focusNode;
    List<TextEditingController> textEditingControllers =
        ref.watch(trabOnBoardingScreenControllerProvider).textEditingController;
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            canPop: false,
            canPush: true,
            backgroundColor: AppColors.backgroundColor,
            trailingColor:
                selectedIndex == 2 ? AppColors.primaryColor : AppColors.grey1,
            onPressedTrailing: () => ref
                .read(trabOnBoardingScreenControllerProvider.notifier)
                .handlePressedTrailing(
                  context: context,
                ),
          ),
          body: SafeArea(
            child: PageView.builder(
              itemCount: 3,
              controller: pageController,
              itemBuilder: (context, index) {
                if (index == 2) {
                  return userInfoInputPage(
                      selectedPage: index,
                      textEditingControllers: textEditingControllers,
                      focusNodes: focusNodes);
                }
                return trabOnboardingPage(selectedPage: index);
              },
              onPageChanged: (value) => ref
                  .read(trabOnBoardingScreenControllerProvider.notifier)
                  .handlePageChanged(index: value),
            ),
          ),
        ),
      ),
    );
  }
}

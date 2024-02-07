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
  List<TextEditingController> textEditingControllers =
      List.generate(2, (_) => TextEditingController());
  PageController pageController = PageController(initialPage: 0);
  List<FocusNode> focusNodes = List.generate(2, (_) => FocusNode());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(trabOnBoardingScreenControllerProvider.notifier).init(
          textEditingController: textEditingControllers, focusNode: focusNodes);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    focusNodes.forEach((element) {
      element.dispose();
    });
    textEditingControllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        ref.watch(trabOnBoardingScreenControllerProvider).selectedPage;

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
                    pageController: pageController,
                    textEditingController: textEditingControllers),
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

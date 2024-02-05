import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/auth/data/model/user_info_model.dart';
import 'package:trab_front/feature/auth/domain/user_domain.dart';
import 'package:trab_front/feature/auth/types.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/helpers/constants/strings.dart';

part 'trab_onboarding_screen_view_model.g.dart';

class TrabOnBoardingScreenState {
  PageController pageController;
  List<FocusNode> focusNode;
  List<TextEditingController> textEditingController;
  int selectedPage;
  TrabOnBoardingScreenState(
      {required this.pageController,
      required this.focusNode,
      required this.textEditingController,
      required this.selectedPage});
}

@riverpod
class TrabOnBoardingScreenController extends _$TrabOnBoardingScreenController {
  @override
  TrabOnBoardingScreenState build() {
    return TrabOnBoardingScreenState(
      selectedPage: 0,
      pageController: PageController(initialPage: 0),
      focusNode: List.generate(2, (_) => FocusNode()),
      textEditingController: List.generate(2, (_) => TextEditingController()),
    );
  }

  void init() {
    UserInfoModel? userInfoModel = ref.read(userControllerProvider).userInfo;
    state.textEditingController[0].text = userInfoModel?.name ?? "";
    state.textEditingController[1].text =
        userInfoModel?.weight?.toString() ?? "";
    state.focusNode.forEach(
      (focusNode) => focusNode.addListener(
        () {
          setState();
        },
      ),
    );
    state.textEditingController.forEach(
      (textEditor) => textEditor.addListener(
        () {
          setState();
        },
      ),
    );
  }

  void setState() {
    state = TrabOnBoardingScreenState(
        selectedPage: state.selectedPage,
        pageController: state.pageController,
        focusNode: state.focusNode,
        textEditingController: state.textEditingController);
  }

  void handlePageChanged({required int index}) {
    state.selectedPage = index;
    setState();
  }

  void handlePressedTrailing() async {
    if (state.pageController.page == 2) {
      Loading.show();
      await ref.read(userControllerProvider.notifier).postUserInfo(
              data: UserInfo(
            name: state.textEditingController[0].text == AppStrings.empty
                ? null
                : state.textEditingController[0].text,
            weight: int.tryParse(state.textEditingController[1].text),
          ));
      Loading.close();
      AppRouter.pushNamed(Routes.HomeScreenRoute);
      return;
    } else {
      state.pageController.jumpToPage(state.pageController.page!.round() + 1);
      state.selectedPage = state.pageController.page!.round();
      setState();
    }
  }
}

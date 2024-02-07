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
  int selectedPage;
  TrabOnBoardingScreenState({required this.selectedPage});
}

@riverpod
class TrabOnBoardingScreenController extends _$TrabOnBoardingScreenController {
  @override
  TrabOnBoardingScreenState build() {
    return TrabOnBoardingScreenState(
      selectedPage: 0,
    );
  }

  void init(
      {required List<TextEditingController> textEditingController,
      required List<FocusNode> focusNode}) async {
    UserInfoModel? userInfoModel =
        await ref.read(userControllerProvider.notifier).getUserInfo();
    if (userInfoModel != null) {
      textEditingController[0].text = userInfoModel.name ?? "TraB";
      textEditingController[1].text = userInfoModel.weight?.toString() ?? "";
      focusNode.forEach(
        (focusNode) => focusNode.addListener(
          () {
            setState();
          },
        ),
      );
      textEditingController.forEach(
        (textEditor) => textEditor.addListener(
          () {
            setState();
          },
        ),
      );
    }
  }

  void setState() {
    state = TrabOnBoardingScreenState(
      selectedPage: state.selectedPage,
    );
  }

  void handlePageChanged({required int index}) {
    state.selectedPage = index;
    setState();
  }

  void handlePressedTrailing({
    required PageController pageController,
    required List<TextEditingController> textEditingController,
  }) async {
    if (pageController.page == 2) {
      Loading.show();
      await ref.read(userControllerProvider.notifier).postUserInfo(
              data: UserInfo(
            name: textEditingController[0].text == AppStrings.empty
                ? null
                : textEditingController[0].text,
            weight: int.tryParse(textEditingController[1].text),
          ));
      Loading.close();
      AppRouter.pushNamed(Routes.HomeScreenRoute);
      return;
    } else {
      pageController.jumpToPage(pageController.page!.round() + 1);
      state.selectedPage = pageController.page!.round();
      setState();
    }
  }
}

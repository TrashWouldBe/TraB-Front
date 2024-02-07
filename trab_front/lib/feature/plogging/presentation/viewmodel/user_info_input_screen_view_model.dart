import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/auth/data/model/user_info_model.dart';
import 'package:trab_front/feature/auth/domain/user_domain.dart';
import 'package:trab_front/feature/auth/types.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/helpers/constants/strings.dart';

part 'user_info_input_screen_view_model.g.dart';

class UserInfoInputScreenState {
  UserInfoInputScreenState();
}

@riverpod
class UserInfoInputScreenController extends _$UserInfoInputScreenController {
  @override
  UserInfoInputScreenState build() {
    return UserInfoInputScreenState();
  }

  void setState() {
    state = UserInfoInputScreenState();
  }

  void init(
      {required List<TextEditingController> textEditingController,
      required List<FocusNode> focusNode}) {
    UserInfoModel? userInfoModel = ref.read(userControllerProvider).userInfo;
    textEditingController[0].text = userInfoModel?.name ?? "";
    textEditingController[1].text = userInfoModel?.weight?.toString() ?? "";
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
    setState();
  }

  void handlePressedContainerButton(
      {required List<TextEditingController> textEditingController}) async {
    Loading.show();
    await ref.read(userControllerProvider.notifier).postUserInfo(
          data: UserInfo(
            name: textEditingController[0].text == AppStrings.empty
                ? null
                : textEditingController[0].text,
            weight: int.tryParse(textEditingController[1].text),
          ),
        );
    Loading.close();
    AppRouter.pushNamed(Routes.PloggingCountDownScreenRoute);
  }
}

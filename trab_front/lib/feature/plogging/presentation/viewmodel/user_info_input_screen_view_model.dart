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
  List<FocusNode> focusNode;
  List<TextEditingController> textEditingController;
  UserInfoInputScreenState({
    required this.focusNode,
    required this.textEditingController,
  });
}

@riverpod
class UserInfoInputScreenController extends _$UserInfoInputScreenController {
  @override
  UserInfoInputScreenState build() {
    return UserInfoInputScreenState(
      focusNode: List.generate(2, (_) => FocusNode()),
      textEditingController: List.generate(2, (_) => TextEditingController()),
    );
  }

  void setState() {
    state = UserInfoInputScreenState(
        focusNode: state.focusNode,
        textEditingController: state.textEditingController);
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

  void handlePressedContainerButton({required BuildContext context}) async {
    showLoading(context: context);
    await ref.read(userControllerProvider.notifier).postUserInfo(
          data: UserInfo(
            name: state.textEditingController[0].text == AppStrings.empty
                ? null
                : state.textEditingController[0].text,
            weight: int.tryParse(state.textEditingController[1].text),
          ),
        );
    closeLoading(context: context);
    AppRouter.pushAndRemoveUntil(Routes.PloggingCountDownScreenRoute);
  }
}

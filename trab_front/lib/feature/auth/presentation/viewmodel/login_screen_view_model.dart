import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/auth/domain/auth_domain.dart';
import 'package:trab_front/feature/common/widget/loading.dart';

part 'login_screen_view_model.g.dart';

class LoginScreenState {
  LoginScreenState();
}

@riverpod
class LoginScreenController extends _$LoginScreenController {
  @override
  LoginScreenState build() {
    return LoginScreenState();
  }

  void socialSignInWithKakao({required BuildContext context}) async {
    try {
      showLoading(context: context);
      await ref.read(authControllerProvider.notifier).socialSignInWithKakao();
      closeLoading(context: context);
      AppRouter.pushAndRemoveUntil(Routes.InitialRoute);
    } catch (error) {
      closeLoading(context: context);
      print(error);
    }
  }

  void socialSignInWithGoogle({required BuildContext context}) async {
    try {
      showLoading(context: context);
      await ref.read(authControllerProvider.notifier).socialSignInWithGoogle();
      closeLoading(context: context);
      AppRouter.pushAndRemoveUntil(Routes.InitialRoute);
    } catch (error) {
      closeLoading(context: context);
      print(error);
    }
  }

  void socialSignInWithApple({required BuildContext context}) async {
    try {
      showLoading(context: context);
      await ref.read(authControllerProvider.notifier).socialSignInWithApple();
      closeLoading(context: context);
      AppRouter.pushAndRemoveUntil(Routes.InitialRoute);
    } catch (error) {
      closeLoading(context: context);
      print(error);
    }
  }
}

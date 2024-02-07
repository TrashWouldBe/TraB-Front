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

  void socialSignInWithKakao() async {
    try {
      Loading.show();
      await ref.read(authControllerProvider.notifier).socialSignInWithKakao();
      Loading.close();
      AppRouter.pushNamed(Routes.InitialRoute);
    } catch (error) {
      Loading.close();
      print(error);
    }
  }

  void socialSignInWithGoogle() async {
    try {
      Loading.show();
      await ref.read(authControllerProvider.notifier).socialSignInWithGoogle();
      Loading.close();
      AppRouter.pushNamed(Routes.InitialRoute);
    } catch (error) {
      Loading.close();
      print(error);
    }
  }

  void socialSignInWithApple() async {
    try {
      Loading.show();
      await ref.read(authControllerProvider.notifier).socialSignInWithApple();
      Loading.close();
      AppRouter.pushNamed(Routes.InitialRoute);
    } catch (error) {
      Loading.close();
      print(error);
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/domain/auth_domain.dart';
import 'package:trab_front/feature/presentation/widget/common/loading.dart';

part 'login_view_model.g.dart';

class LoginViewState {
  LoginViewState();
}

@riverpod
class LoginViewController extends _$LoginViewController {
  @override
  LoginViewState build() {
    return LoginViewState();
  }

  //상태 업데이트
  void setState() {}

  void socialSignInWithKakao({required BuildContext context}) async {
    showLoading(context: context);
    await ref.read(authControllerProvider.notifier).socialSignInWithKakao();
    closeLoading(context: context);
  }

  void socialSignInWithGoogle({required BuildContext context}) async {
    showLoading(context: context);
    await ref.read(authControllerProvider.notifier).socialSignInWithGoogle();
    closeLoading(context: context);
  }
}

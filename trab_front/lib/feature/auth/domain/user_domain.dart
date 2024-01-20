
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/auth/data/dataSource/user_data_source.dart';

part 'user_domain.g.dart';

class UserState {
  UserDataSource userDataSource;

  UserState({required this.userDataSource});
}

@riverpod
class UserController extends _$UserController {
  @override
  UserState build() {
    return UserState(
      userDataSource: UserDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  Future<void> getUserInfo() async {
    try {
      var data = await state.userDataSource.getUserInfo();
      // if (data != null) {
      //   AuthModel authModel =
      //       await state.authDataSource.socialSignInWithKakao(data: data);
      //   await firebase_auth.FirebaseAuth.instance
      //       .signInWithCustomToken(authModel.token);
      // }
    } catch (error) {
      print(error);
    }
  }
}
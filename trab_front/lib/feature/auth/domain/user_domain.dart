import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/auth/data/dataSource/user_data_source.dart';
import 'package:trab_front/feature/auth/data/model/user_info_model.dart';
import 'package:trab_front/feature/auth/types.dart';

part 'user_domain.g.dart';

class UserState {
  UserDataSource userDataSource;
  UserInfoModel? userInfo;

  UserState({required this.userDataSource, this.userInfo});
}

@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override
  UserState build() {
    return UserState(
      userDataSource: UserDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  void setState() {
    state = UserState(
        userDataSource: state.userDataSource, userInfo: state.userInfo);
  }

  Future<UserInfoModel?> getUserInfo() async {
    try {
      UserInfoModel userInfo = await state.userDataSource.getUserInfo();
      state.userInfo = userInfo;
      setState();
      return userInfo;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<void> postUserInfo({required UserInfo data}) async {
    try {
      UserInfoModel userInfo =
          await state.userDataSource.postUserInfo(data: data);
      state.userInfo = userInfo;
      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteUser() async {
    try {
      await state.userDataSource.deleteUser();
    } catch (error) {
      print(error);
    }
  }

  Future<void> patchUserImage({required file}) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          file,
          filename: 'image.png',
        )
      });
      String _userImage =
          await state.userDataSource.patchUserImage(data: formData);
      if (state.userInfo != null) {
        state.userInfo = state.userInfo!.copyWith(image: _userImage);
        setState();
      }
    } catch (error) {
      print(error);
    }
  }
}

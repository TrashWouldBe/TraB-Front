import 'package:dio/dio.dart';
import 'package:trab_front/feature/auth/data/model/user_info_model.dart';

import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';
import 'package:trab_front/feature/auth/types.dart';

class UserDataSource {
  final ApiService _apiService;

  UserDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<UserInfoModel> postUserInfo({required UserInfo data}) async {
    return _apiService.setData<UserInfoModel>(
      endpoint: ApiEndpoint.user(UserEndpoint.USER),
      data: data.toJson(),
      converter: (response) {
        return UserInfoModel.fromJson(response.body);
      },
    );
  }

  Future<UserInfoModel> getUserInfo() async {
    return _apiService.getDocumentData<UserInfoModel>(
      endpoint: ApiEndpoint.user(UserEndpoint.USER),
      converter: (response) {
        return UserInfoModel.fromJson(response.body);
      },
    );
  }

  Future<void> deleteUser() async {
    return _apiService.deleteData<void>(
      endpoint: ApiEndpoint.user(UserEndpoint.USER),
      converter: (response) {
        print(response);
      },
    );
  }

  Future<String> patchUserImage({required FormData data}) async {
    return _apiService.updateDataWithImage(
      endpoint: ApiEndpoint.user(UserEndpoint.IMAGE),
      data: data,
      converter: (response) {
        return response.body;
      },
    );
  }
}

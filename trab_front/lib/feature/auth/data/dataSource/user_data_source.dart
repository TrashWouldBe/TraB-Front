import 'package:dio/dio.dart';
import 'package:trab_front/feature/auth/data/model/user_info_model.dart';

import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';

class UserDataSource {
  final ApiService _apiService;

  UserDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<UserInfoModel> getUserInfo() async {
    return _apiService.getDocumentData<UserInfoModel>(
      endpoint: ApiEndpoint.user(UserEndpoint.USER),
      converter: (response) {
        return UserInfoModel.fromJson(response.body);
      },
    );
  }

  Future<void> deleteUser() async {
    return _apiService.deleteData(
      endpoint: ApiEndpoint.user(UserEndpoint.USER),
      converter: (response) {},
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

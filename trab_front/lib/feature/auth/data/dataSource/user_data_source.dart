import 'package:dio/dio.dart';
import 'package:trab_front/feature/auth/data/model/user_model.dart';

import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';

class UserDataSource {
  final ApiService _apiService;

  UserDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<UserModel> getUserInfo() async {
    return _apiService.getDocumentData(
      endpoint: ApiEndpoint.user(UserEndpoint.USER),
      converter: (response) {
        print(response);
        return UserModel.fromJson(response);
      },
    );
  }

  Future<void> deleteUser() async {
    return _apiService.deleteData(
      endpoint: ApiEndpoint.user(UserEndpoint.USER),
      converter: (response) {
        print(response);
      },
    );
  }

  Future<void> socialSignInWithApple() async {
    var formData = FormData.fromMap({
      'name': 'wendux',
      'age': 25,
      'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt')
    });
    return _apiService.updateDataWithImage(
      endpoint: ApiEndpoint.user(UserEndpoint.IMAGE),
      data: formData,
      converter: (response) {
        print(response);
      },
    );
  }
}

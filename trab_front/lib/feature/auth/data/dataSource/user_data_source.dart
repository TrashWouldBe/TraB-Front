import 'package:trab_front/feature/auth/data/model/auth_model.dart';
import 'package:trab_front/feature/auth/data/model/user_model.dart';
import 'package:trab_front/feature/auth/types.dart';

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

  Future<AuthModel> socialSignInWithGoogle({
    required GoogleSignInBody data,
  }) async {
    return _apiService.setData<AuthModel>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.GOOGLE),
      data: data.toJson(),
      converter: (response) {
        return AuthModel.fromJson(response.body);
      },
    );
  }

  Future<AuthModel> socialSignInWithApple({
    required AppleSignInBody data,
  }) async {
    return _apiService.setData<AuthModel>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.APPLE),
      data: data.toJson(),
      converter: (response) {
        return AuthModel.fromJson(response.body);
      },
    );
  }
}

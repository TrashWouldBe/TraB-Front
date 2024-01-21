import 'package:trab_front/feature/auth/data/model/auth_model.dart';
import 'package:trab_front/feature/auth/types.dart';

import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';

class AuthDataSource {
  final ApiService _apiService;

  AuthDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<AuthModel> socialSignInWithKakao({
    required KakaoSignInBody data,
  }) async {
    return _apiService.setData<AuthModel>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.KAKAO),
      data: data.toJson(),
      converter: (response) {
        return AuthModel.fromJson(response.body);
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

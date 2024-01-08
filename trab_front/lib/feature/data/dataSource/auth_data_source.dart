import 'package:trab_front/feature/data/model/auth_model.dart';
import 'package:trab_front/helpers/typedefs.dart';
import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';

class AuthDataSource {
  final ApiService _apiService;

  AuthDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<AuthModel> socialSignInWithKakao({
    required JSON data,
  }) async {
    return _apiService.setData<AuthModel>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.KAKAO),
      data: data,
      converter: (response) {
        return AuthModel.fromJson(response.body);
      },
    );
  }

  Future<AuthModel> socialSignInWithGoogle({
    required JSON data,
  }) async {
    return _apiService.setData<AuthModel>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.GOOGLE),
      data: data,
      converter: (response) {
        return AuthModel.fromJson(response.body);
      },
    );
  }
}

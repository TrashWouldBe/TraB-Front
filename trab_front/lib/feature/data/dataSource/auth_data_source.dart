import 'package:flutter/foundation.dart';
import 'package:trab_front/feature/data/model/auth_model.dart';
import 'package:trab_front/helpers/typedefs.dart';
import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';

class AuthDataSource {
  final ApiService _apiService;

  AuthDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<AuthModel> socialSignIn({
    required JSON data,
    required JSON queryParams,
  }) async {
    return _apiService.setData<AuthModel>(
      endpoint: ApiEndpoint.auth(AuthEndpoint.KAKAO),
      data: data,
      queryParams: queryParams,
      converter: (response) {
        return AuthModel.fromJson(response.body);
      },
    );
  }
}

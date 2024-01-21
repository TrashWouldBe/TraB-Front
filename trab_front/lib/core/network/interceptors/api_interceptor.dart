// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor() : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String? idToken = await currentUser.getIdToken();
      if (idToken != null) {
        options.headers.addAll(
          <String, Object?>{'Authorization': 'Bearer $idToken'},
        );
      }
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    bool success = response.data['code'] == 1;
    if (success) {
      handler.resolve(response);
    } else {
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    }
  }
}

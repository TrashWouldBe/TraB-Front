// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trab_front/feature/all_providers.dart';

class ApiInterceptor extends Interceptor {
  late final Ref _ref;

  ApiInterceptor(this._ref) : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token =
        await _ref.watch(keyValueStorageServiceProvider).getAuthToken();
    // options.headers.addAll(
    //   <String, Object?>{'Authorization': 'Bearer $token'},
    // );

    options.extra.remove('requiresAuthToken');

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

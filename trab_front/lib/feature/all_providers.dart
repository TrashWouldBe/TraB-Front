import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trab_front/core/local/key_value_storage_service.dart';
import 'package:trab_front/core/local/path_provider_service.dart';
import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';
import 'package:trab_front/core/network/dio_service.dart';
import 'package:trab_front/core/network/interceptors/api_interceptor.dart';
import 'package:trab_front/core/network/interceptors/logging_interceptor.dart';

final keyValueStorageServiceProvider = Provider<KeyValueStorageService>(
  (ref) => KeyValueStorageService(),
);

final _dioProvider = Provider<Dio>((ref) {
  final baseOptions = BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
  );
  return Dio(baseOptions);
});

final _dioServiceProvider = Provider<DioService>((ref) {
  final _dio = ref.watch(_dioProvider);
  final _cacheOptions = CacheOptions(
    store: HiveCacheStore(PathProviderService.path),
    policy: CachePolicy.noCache,
    maxStale: const Duration(days: 30),
    keyBuilder: (options) => options.path,
  );
  return DioService(
    dioClient: _dio,
    globalCacheOptions: _cacheOptions,
    interceptors: [
      ApiInterceptor(),
      DioCacheInterceptor(options: _cacheOptions),
      if (kDebugMode) LoggingInterceptor(),
    ],
  );
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final _dioService = ref.watch(_dioServiceProvider);
  return ApiService(_dioService);
});

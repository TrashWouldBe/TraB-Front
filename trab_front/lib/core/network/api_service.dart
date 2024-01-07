import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:trab_front/helpers/typedefs.dart';

import './custom_exception.dart';

import './api_interface.dart';
import './dio_service.dart';

import 'response_model.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;
  ApiService(DioService dioService) : _dioService = dioService;

  @override
  Future<List<T>> getCollectionData<T>({
    required String endpoint,
    JSON? queryParams,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    required T Function(JSON responseBody) converter,
  }) async {
    List<Object?> body;

    try {
      // Entire map of response
      final data = await _dioService.get<List<Object?>>(
        endpoint: endpoint,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
        queryParams: queryParams,
      );

      // Items of table as json
      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the deserialized objects
      return body.map((dataMap) => converter(dataMap! as JSON)).toList();
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    required T Function(JSON response) converter,
  }) async {
    JSON body;
    try {
      // Entire map of response

      final data = await _dioService.get<JSON>(
        endpoint: endpoint,
        queryParams: queryParams,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale: cacheAgeDays != null
              ? Nullable(Duration(days: cacheAgeDays))
              : null,
        ),
      );

      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the deserialized object
      return converter(body);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    Map<String, dynamic> headers = const {},
    required T Function(ResponseModel<JSON> response) converter,
  }) async {
    ResponseModel<JSON> response;
    try {
      // Entire map of response
      response = await _dioService.post<JSON>(
        endpoint: endpoint,
        data: data,
        queryParameters: headers,
        options: Options(),
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    required T Function(ResponseModel<JSON> response) converter,
  }) async {
    ResponseModel<JSON> response;

    try {
      // Entire map of response
      response = await _dioService.patch<JSON>(
        endpoint: endpoint,
        data: data,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    required T Function(ResponseModel<JSON> response) converter,
  }) async {
    ResponseModel<JSON> response;

    try {
      // Entire map of response
      response = await _dioService.delete<JSON>(
        endpoint: endpoint,
        data: data,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      // Returning the serialized object
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }
}

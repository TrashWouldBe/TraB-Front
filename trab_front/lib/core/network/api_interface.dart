import 'package:dio/dio.dart';
import 'package:trab_front/helpers/typedefs.dart';

import 'response_model.dart';

abstract class ApiInterface {
  const ApiInterface();

  Future<List<T>> getCollectionData<T>({
    required String endpoint,
    JSON? queryParams,
    required T Function(JSON responseBody) converter,
  });

  Future<T> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    required T Function(ResponseModel<JSON> responseBody) converter,
  });

  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    Map<String, dynamic> queryParams,
    required T Function(ResponseModel<JSON> response) converter,
  });

  Future<T> setDataWithImage<T>({
    required String endpoint,
    required FormData data,
    Map<String, dynamic> queryParams,
    required T Function(ResponseModel<JSON> response) converter,
  });

  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    required T Function(ResponseModel<JSON> response) converter,
  });

  Future<T> updateDataWithImage<T>({
    required String endpoint,
    required FormData data,
    required T Function(ResponseModel<JSON> response) converter,
  });

  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    required T Function(ResponseModel<JSON> response) converter,
  });
}

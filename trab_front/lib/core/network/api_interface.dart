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
    required T Function(JSON responseBody) converter,
  });

  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    Map<String, dynamic> queryParams,
    required T Function(ResponseModel<JSON> response) converter,
  });

  Future<T> updateData<T>({
    required String endpoint,
    required JSON data,
    required T Function(ResponseModel<JSON> response) converter,
  });

  Future<T> deleteData<T>({
    required String endpoint,
    JSON? data,
    required T Function(ResponseModel<JSON> response) converter,
  });
}

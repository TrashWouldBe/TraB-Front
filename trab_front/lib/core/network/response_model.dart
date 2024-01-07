import 'package:trab_front/helpers/typedefs.dart';

class ResponseModel<T> {
  final dynamic body;
  final int code;
  final String message;

  const ResponseModel({
    required this.body,
    required this.code,
    required this.message,
  });

  factory ResponseModel.fromJson(JSON json) {
    return ResponseModel(
      code: json['code'],
      message: json['message'],
      body: json['data'],
    );
  }
}

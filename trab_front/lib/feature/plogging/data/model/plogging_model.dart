// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'plogging_model.freezed.dart';
part 'plogging_model.g.dart';

@freezed
class PloggingModel with _$PloggingModel {
  const factory PloggingModel({
    required String user_email,
    String? user_image,
  }) = _PloggingModel;

  factory PloggingModel.fromJson(JSON json) => _$PloggingModelFromJson(json);
}

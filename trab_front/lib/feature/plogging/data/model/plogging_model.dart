// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'plogging_model.freezed.dart';
part 'plogging_model.g.dart';

@freezed
class PloggingModel with _$PloggingModel {
  const factory PloggingModel({
    required int ploggingId,
    required String runDate,
    required String runName,
    required double runRange,
    required String runTime,
    required int trabSnack,
    required int calorie,
  }) = _PloggingModel;

  factory PloggingModel.fromJson(JSON json) => _$PloggingModelFromJson(json);

  static List<PloggingModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => PloggingModel.fromJson(json as JSON))
        .toList();
  }
}

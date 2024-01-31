// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_funiture_model.freezed.dart';
part 'trab_funiture_model.g.dart';

@freezed
class TrabFunitureModel with _$TrabFunitureModel {
  const factory TrabFunitureModel({
    required int funitureId,
    required String name,
    required bool isArrange,
    required bool isGet,
  }) = _TrabFunitureModel;

  factory TrabFunitureModel.fromJson(JSON json) =>
      _$TrabFunitureModelFromJson(json);

  static List<TrabFunitureModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TrabFunitureModel.fromJson(json as JSON))
        .toList();
  }
}

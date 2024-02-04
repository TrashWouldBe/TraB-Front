// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_furniture_model.freezed.dart';
part 'trab_furniture_model.g.dart';

@freezed
class TrabFurnitureModel with _$TrabFurnitureModel {
  const factory TrabFurnitureModel({
    required int funitureId,
    required String name,
    required bool isArrange,
    required bool isGet,
  }) = _TrabFurnitureModel;

  factory TrabFurnitureModel.fromJson(JSON json) =>
      _$TrabFurnitureModelFromJson(json);

  static List<TrabFurnitureModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TrabFurnitureModel.fromJson(json as JSON))
        .toList();
  }
}

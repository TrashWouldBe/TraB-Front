// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/enums/furniture_type.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_furniture_model.freezed.dart';

@freezed
class TrabFurnitureModel with _$TrabFurnitureModel {
  const factory TrabFurnitureModel({
    required int furnitureId,
    required String name,
    required bool isArrange,
    required bool isGet,
    @Default(FurnitureType.familyPhoto) FurnitureType furnitureEnumType,
  }) = _TrabFurnitureModel;

  factory TrabFurnitureModel.fromJson(JSON json) {
    return TrabFurnitureModel(
      furnitureId: json['furnitureId'] as int,
      name: json['name'] as String,
      isArrange: json['isArrange'] as bool,
      isGet: json['isGet'] as bool,
      furnitureEnumType: json['name'].toString().toFurnitureType(),
    );
  }

  static List<TrabFurnitureModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TrabFurnitureModel.fromJson(json as JSON))
        .toList();
  }
}

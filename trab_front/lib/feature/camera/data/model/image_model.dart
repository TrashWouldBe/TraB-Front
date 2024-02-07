// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/enums/trash_type.dart';
import 'package:trab_front/helpers/extensions/string_extension.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'image_model.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String imageUrl,
    required String trashType,
    @Default(TrashType.glass) TrashType trashEnumType,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      imageUrl: json['imageUrl'] as String,
      trashType: json['trashType'] as String,
      trashEnumType: (json['trashType'] as String).toTrashType(),
    );
  }

  static List<ImageModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ImageModel.fromJson(json as JSON)).toList();
  }
}

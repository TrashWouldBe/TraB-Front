// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/enums/trash_type.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_snack_model.freezed.dart';
part 'trab_snack_model.g.dart';

@freezed
class TrabSnackModel with _$TrabSnackModel {
  const factory TrabSnackModel(
      {required int glass,
      required int paper,
      // ignore: invalid_annotation_target
      @JsonKey(name: "metal") required int can,
      required int plastic,
      required int vinyl,
      required int styrofoam,
      required int general,
      required int food}) = _TrabSnackModel;

  factory TrabSnackModel.fromJson(JSON json) => _$TrabSnackModelFromJson(json);
}

extension TrabSnackModelExtension on TrabSnackModel {
  int getTotalWasteCount() {
    return glass + paper + can + plastic + vinyl + styrofoam + general + food;
  }

  int getCountForTrashType(TrashType type) {
    switch (type) {
      case TrashType.glass:
        return glass;
      case TrashType.paper:
        return paper;
      case TrashType.metal:
        return can;
      case TrashType.plastic:
        return plastic;
      case TrashType.vinyl:
        return vinyl;
      case TrashType.styrofoam:
        return styrofoam;
      case TrashType.general:
        return general;
      case TrashType.food:
        return food;
      default:
        return 0;
    }
  }
}

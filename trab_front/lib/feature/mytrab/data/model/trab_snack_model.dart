// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_snack_model.freezed.dart';
part 'trab_snack_model.g.dart';

@freezed
class TrabSnackModel with _$TrabSnackModel {
  const factory TrabSnackModel(
      {required int glass,
      required int paper,
      required int can,
      required int plastic,
      required int vinyl,
      required int styrofoam,
      required int general,
      required int food}) = _TrabSnackModel;

  factory TrabSnackModel.fromJson(JSON json) => _$TrabSnackModelFromJson(json);
}

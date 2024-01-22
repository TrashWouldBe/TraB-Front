import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_model.freezed.dart';
part 'trab_model.g.dart';

@freezed
class TrabModel with _$TrabModel {
  const factory TrabModel({
    required int trabId,
    required String trabName,
    required int snackCnt,
  }) = _TrabModel;

  factory TrabModel.fromJson(JSON json) => _$TrabModelFromJson(json);
}

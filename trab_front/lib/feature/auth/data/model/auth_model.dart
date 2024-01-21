import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String uid,
    required String token,
  }) = _AuthModel;

  factory AuthModel.fromJson(JSON json) => _$AuthModelFromJson(json);
}

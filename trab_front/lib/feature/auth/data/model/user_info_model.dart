// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    required String user_email,
    String? user_image,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(JSON json) => _$UserInfoModelFromJson(json);
}

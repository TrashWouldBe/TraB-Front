// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
class KakaoSignInBody with _$KakaoSignInBody {
  const factory KakaoSignInBody({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'fcm_token') required String fcmToken,
  }) = _KakaoSignInBody;

  factory KakaoSignInBody.fromJson(JSON json) =>
      _$KakaoSignInBodyFromJson(json);
}

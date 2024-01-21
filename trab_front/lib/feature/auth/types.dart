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

@freezed
class GoogleSignInBody with _$GoogleSignInBody {
  const factory GoogleSignInBody({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'profileImage') required String? profileImage,
    @JsonKey(name: 'fcm_token') required String fcmToken,
  }) = _GoogleSignInBody;

  factory GoogleSignInBody.fromJson(JSON json) =>
      _$GoogleSignInBodyFromJson(json);
}

@freezed
class AppleSignInBody with _$AppleSignInBody {
  const factory AppleSignInBody({
    @JsonKey(name: 'id_token') required String idToken,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'fcm_token') required String fcmToken,
  }) = _AppleSignInBody;

  factory AppleSignInBody.fromJson(JSON json) =>
      _$AppleSignInBodyFromJson(json);
}

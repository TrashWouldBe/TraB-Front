import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/data/dataSource/auth_data_source.dart';
import 'package:trab_front/feature/data/model/auth_model.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'auth_domain.g.dart';

class AuthState {
  AuthDataSource authDataSource;

  AuthState({required this.authDataSource});
}

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return AuthState(
      authDataSource: AuthDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  Future<dynamic> socialSignIn(
      {required JSON data, required JSON provider}) async {
    try {
      AuthModel authModel = await state.authDataSource
          .socialSignIn(data: data, queryParams: provider);
      print(authModel);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> signInWithKakao() async {
    // try {
    //   await UserApi.instance.unlink();
    //   print('연결 끊기 성공, SDK에서 토큰 삭제');
    // } catch (error) {
    //   print('연결 끊기 실패 $error');
    // }

    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();

        await socialSignIn(data: {
          "access_token": auth.accessToken,
          "fcm_token": "여기에_FCM_토큰을_입력"
        }, provider: {
          "provider": "kakao"
        });
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        try {
          OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();

          await socialSignIn(data: {
            "access_token": auth.accessToken,
            "fcm_token": "여기에_FCM_토큰을_입력"
          }, provider: {
            "provider": "kakao"
          });
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();
        await socialSignIn(data: {
          "access_token": auth.accessToken,
          "fcm_token": "여기에_FCM_토큰을_입력"
        }, provider: {
          "provider": "kakao"
        });
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }
}

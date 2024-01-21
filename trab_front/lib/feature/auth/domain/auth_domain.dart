import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/auth/data/dataSource/auth_data_source.dart';
import 'package:trab_front/feature/auth/data/model/auth_model.dart';
import 'package:trab_front/feature/auth/domain/user_domain.dart';
import 'package:trab_front/feature/auth/types.dart';

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

  Future<void> socialSignInWithKakao() async {
    try {
      KakaoSignInBody? data = await signInWithKakao();
      if (data != null) {
        AuthModel authModel =
            await state.authDataSource.socialSignInWithKakao(data: data);
        await firebase_auth.FirebaseAuth.instance
            .signInWithCustomToken(authModel.token);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> socialSignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        GoogleSignInBody data = GoogleSignInBody(
            email: googleUser.email,
            name: googleUser.displayName ?? "TraB",
            profileImage: googleUser.photoUrl,
            fcmToken: "fcm_token");
        AuthModel authModel =
            await state.authDataSource.socialSignInWithGoogle(data: data);
        await firebase_auth.FirebaseAuth.instance
            .signInWithCustomToken(authModel.token);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<KakaoSignInBody?> signInWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();
        return KakaoSignInBody(
            accessToken: auth.accessToken, fcmToken: "fcm_token");
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        if (error is PlatformException && error.code == 'CANCELED') {}
        try {
          OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();
          return KakaoSignInBody(
              accessToken: auth.accessToken, fcmToken: "fcm_token");
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();
        return KakaoSignInBody(
            accessToken: auth.accessToken, fcmToken: "fcm_token");
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  Future<void> socialSignInWithApple() async {
    try {
      AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'de.lunaone.flutter.signinwithappleexample.service',
          redirectUri: kIsWeb
              ? Uri.parse('https://pub.dev/packages/sign_in_with_apple/example')
              : Uri.parse(
                  'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
                ),
        ),
        nonce: 'example-nonce',
        state: 'example-state',
      );
      if (credential.identityToken != null &&
          credential.userIdentifier != null) {
        AppleSignInBody data = AppleSignInBody(
            idToken: credential.identityToken!,
            id: credential.userIdentifier!,
            firstName: credential.givenName ?? "T",
            lastName: credential.familyName ?? "raB",
            fcmToken: "fcm_token");
        AuthModel authModel =
            await state.authDataSource.socialSignInWithApple(data: data);
        await firebase_auth.FirebaseAuth.instance
            .signInWithCustomToken(authModel.token);
      }
    } catch (error) {
      print(error);
    }
  }

  void signOut() async {
    try {
      await firebase_auth.FirebaseAuth.instance.signOut();
      AppRouter.pushAndRemoveUntil(Routes.LoginScreenRoute);
    } catch (e) {
      print(e);
    }
  }

  void withdrawal() async {
    try {
      await firebase_auth.FirebaseAuth.instance.signOut();
      await ref.read(userControllerProvider.notifier).deleteUser();
      AppRouter.pushAndRemoveUntil(Routes.LoginScreenRoute);
    } catch (e) {
      print(e);
    }
  }
}

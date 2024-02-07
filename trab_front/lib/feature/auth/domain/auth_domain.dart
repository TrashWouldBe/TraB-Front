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
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/helpers/constants/strings.dart';

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
      throw error;
    }
  }

  Future<void> socialSignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        GoogleSignInBody data = GoogleSignInBody(
            email: googleUser.email,
            name: googleUser.displayName ?? AppStrings.trab,
            profileImage: googleUser.photoUrl ??
                "https://storage.googleapis.com/trab-image/%5Bobject%20Object%5D/profile-image/profile.png",
            fcmToken: "fcm_token");
        AuthModel authModel =
            await state.authDataSource.socialSignInWithGoogle(data: data);
        await firebase_auth.FirebaseAuth.instance
            .signInWithCustomToken(authModel.token);
      } else {
        throw Exception(AppStrings.googleSignInError);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<KakaoSignInBody?> signInWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();
        return KakaoSignInBody(
            accessToken: auth.accessToken, fcmToken: "fcm_token");
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {}
        try {
          OAuthToken auth = await UserApi.instance.loginWithKakaoTalk();
          return KakaoSignInBody(
              accessToken: auth.accessToken, fcmToken: "fcm_token");
        } catch (error) {
          throw error;
        }
      }
    } else {
      try {
        OAuthToken auth = await UserApi.instance.loginWithKakaoAccount();
        return KakaoSignInBody(
            accessToken: auth.accessToken, fcmToken: "fcm_token");
      } catch (error) {
        throw error;
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
      } else {
        throw Exception(AppStrings.appleSignInError);
      }
    } catch (error) {
      throw error;
    }
  }

  void signOut() async {
    try {
      Loading.show();
      await firebase_auth.FirebaseAuth.instance.signOut();
      Loading.close();
      AppRouter.pushNamed(Routes.LoginScreenRoute);
    } catch (e) {
      print(e);
    }
  }

  void withdrawal() async {
    try {
      Loading.show();
      await ref.read(userControllerProvider.notifier).deleteUser();
      await firebase_auth.FirebaseAuth.instance.signOut();
      Loading.close();
      AppRouter.pushNamed(Routes.LoginScreenRoute);
    } catch (e) {
      print(e);
    }
  }
}

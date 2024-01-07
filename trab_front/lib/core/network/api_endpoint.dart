// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

import '../../config/config.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();
  static const baseUrl = Config.baseUrl;

  static String auth(AuthEndpoint endpoint) {
    const path = '/auth';
    switch (endpoint) {
      case AuthEndpoint.APPLE:
        return '$path/socialSignInWithApple';
      case AuthEndpoint.KAKAO:
        return '$path/socialSignIn';
    }
  }
}

enum AuthEndpoint {
  KAKAO,
  APPLE,
}

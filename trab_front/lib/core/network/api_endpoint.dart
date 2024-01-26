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
        return '$path/socialSignInWithKakao';
      case AuthEndpoint.GOOGLE:
        return '$path/socialSignInWithGoogle';
    }
  }

  static String user(UserEndpoint endpoint) {
    const path = '/user';
    switch (endpoint) {
      case UserEndpoint.USER:
        return '$path';
      case UserEndpoint.IMAGE:
        return '$path/image';
    }
  }

  static String plogging(PloggingEndPoint endPoint) {
    const path = '/plogging';
    switch (endPoint) {
      case PloggingEndPoint.PLOGGING:
        return '$path';
      case PloggingEndPoint.LIST:
        return '$path/list';
    }
  }

  static String trab(TrabEndpoint endpoint) {
    const path = '/trab';
    switch (endpoint) {
      case TrabEndpoint.TRAB:
        return '$path';
    }
  }
}

enum AuthEndpoint {
  KAKAO,
  APPLE,
  GOOGLE,
}

enum UserEndpoint {
  USER,
  IMAGE,
}

enum PloggingEndPoint {
  PLOGGING,
  LIST,
}

enum TrabEndpoint {
  TRAB,
}

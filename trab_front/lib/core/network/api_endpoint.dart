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

  static String plogging(PloggingEndpoint endPoint) {
    const path = '/plogging';
    switch (endPoint) {
      case PloggingEndpoint.PLOGGING:
        return '$path';
      case PloggingEndpoint.LIST:
        return '$path/list';
    }
  }

  static String image(ImageEndPoint endPoint) {
    const path = '/image';
    switch (endPoint) {
      case ImageEndPoint.Image:
        return '$path';
    }
  }

  static String trab(TrabEndpoint endpoint) {
    const path = '/trab';
    switch (endpoint) {
      case TrabEndpoint.TRAB:
        return '$path';
      case TrabEndpoint.FURNITURE:
        return '$path/furniture';
      case TrabEndpoint.FURNITURE_LIST:
        return '$path/furniture/list';
      case TrabEndpoint.FURNITURE_INFO:
        return '$path/furniture/info';
      case TrabEndpoint.FURNITURE_ARRANGED:
        return '$path/furniture/arranged';
      case TrabEndpoint.SNACK:
        return '$path/snack';
      case TrabEndpoint.SNACK_TRASH_LIST:
        return '$path/snack/trashList';
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

enum ImageEndPoint {
  Image,
}

enum PloggingEndpoint {
  PLOGGING,
  LIST,
}

enum TrabEndpoint {
  TRAB,
  FURNITURE,
  FURNITURE_LIST,
  FURNITURE_INFO,
  FURNITURE_ARRANGED,
  SNACK,
  SNACK_TRASH_LIST,
}

import 'dart:async';

import 'package:clock/clock.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:trab_front/core/local/key_value_storage_base.dart';
import 'package:trab_front/core/local/path_provider_service.dart';
import 'package:trab_front/main.dart';
// Config
import 'firebase_options.dart';

class AppBootstrapper {
  const AppBootstrapper._();

  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {
    debugPrint = _prettifyDebugPrint;
    // For preparing the key-value mem cache
    await KeyValueStorageBase.init();

    // For preparing to read application directory paths
    await PathProviderService.init();
    KakaoSdk.init(nativeAppKey: '0e922fab391d4b972bd2e03606d728af');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(const TraB());
  }

  static void _prettifyDebugPrint(String? message, {int? wrapWidth}) {
    final date = clock.now();
    var msg = '${date.year}/${date.month}/${date.day}';
    msg += ' ${date.hour}:${date.minute}:${date.second}';
    msg += ' $message';
    debugPrintSynchronously(msg, wrapWidth: wrapWidth);
  }
}

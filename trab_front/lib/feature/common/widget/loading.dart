import 'package:flutter/material.dart';
import 'package:trab_front/config/routes/app_router.dart';

@immutable
class Loading {
  const Loading._();
  static void show() {
    showDialog(
      context: AppRouter.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  static void close() {
    AppRouter.pop();
  }
}

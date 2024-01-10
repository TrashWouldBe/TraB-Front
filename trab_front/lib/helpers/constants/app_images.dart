import 'package:flutter/material.dart';

// Helpers
import 'app_colors.dart';

/// A utility class that holds themes for the app. It controls
/// how the app looks on different platforms like android, ios etc.
///
/// This class has no constructor and all methods are `static`.
@immutable
class AppImages {
  const AppImages._();
  static String basePath = "assets/images";
  static String timerEllipse = "$basePath/timer_ellipse.png";
  static String kakaoLogin = "$basePath/kakao_login.png";
  static String googleLogin = "$basePath/google_login.png";
  static String appleLogin = "$basePath/apple_login.png";
  static String stopButton = "$basePath/stop_button.png";
  static String cameraButton = "$basePath/camera_button.png";
  static String restartbutton = "$basePath/restart_button.png";
}

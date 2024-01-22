import 'package:flutter/material.dart';

const String basePath = "https://storage.googleapis.com/trab-image/trab_gif";

@immutable
class AppGifs {
  const AppGifs._();

  static String runTrab = "$basePath/running_trab.gif";
  static String runT = "$basePath/run_trab.gif";
}

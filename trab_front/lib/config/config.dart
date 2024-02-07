import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class Config {
  const Config._();

  static String baseUrl = dotenv.env['API_URL'] ?? "";
}

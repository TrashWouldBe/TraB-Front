import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageBase {
  static SharedPreferences? _sharedPrefs;
  static FlutterSecureStorage? _secureStorage;
  static KeyValueStorageBase? _instance;
  factory KeyValueStorageBase() => _instance ?? const KeyValueStorageBase._();
  const KeyValueStorageBase._();
  static Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
    _secureStorage ??= const FlutterSecureStorage();
  }

  T? getCommon<T>(String key) {
    try {
      switch (T) {
        case String:
          return _sharedPrefs!.getString(key) as T?;
        case int:
          return _sharedPrefs!.getInt(key) as T?;
        case bool:
          return _sharedPrefs!.getBool(key) as T?;
        case double:
          return _sharedPrefs!.getDouble(key) as T?;
        default:
          return _sharedPrefs!.get(key) as T?;
      }
    } on Exception catch (ex) {
      debugPrint('$ex');
      return null;
    }
  }

  Future<String?> getEncrypted(String key) {
    try {
      return _secureStorage!.read(key: key);
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return Future<String?>.value();
    }
  }

  Future<bool> setCommon<T>(String key, T value) {
    switch (T) {
      case String:
        return _sharedPrefs!.setString(key, value as String);
      case int:
        return _sharedPrefs!.setInt(key, value as int);
      case bool:
        return _sharedPrefs!.setBool(key, value as bool);
      case double:
        return _sharedPrefs!.setDouble(key, value as double);
      default:
        return _sharedPrefs!.setString(key, value as String);
    }
  }

  Future<bool> setEncrypted(String key, String value) {
    try {
      _secureStorage!.write(key: key, value: value);
      return Future.value(true);
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return Future.value(false);
    }
  }

  Future<bool> clearCommon() => _sharedPrefs!.clear();

  Future<bool> clearEncrypted() async {
    try {
      await _secureStorage!.deleteAll();
      return true;
    } on PlatformException catch (ex) {
      debugPrint('$ex');
      return false;
    }
  }
}

// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mertali/product/cache/product_cache_constants.dart';

class ProductStorageManager {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> write({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read({
    required String key,
  }) async {
    return await _storage.read(key: key);
  }

  static Future<void> delete({
    required String key,
  }) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  static Future<String?> getTheme() async {
    return await _storage.read(
      key: ProductCacheConstants.themeKey.value,
    );
  }

  static Future<void> setTheme({
    required String theme,
  }) async {
    await _storage.write(
      key: ProductCacheConstants.themeKey.value,
      value: theme,
    );
  }

  static ThemeData themeData({
    required String? theme,
  }) {
    switch (theme) {
      case 'dark':
        return ThemeData.dark();
      default:
        return ThemeData.light();
    }
  }

  static StreamSubscription<String?> getThemeStream() {
    _storage
        .read(key: ProductCacheConstants.themeKey.value)
        .asStream()
        .listen((event) {
      log(event.toString());
    });

    return _storage
        .read(key: ProductCacheConstants.themeKey.value)
        .asStream()
        .listen((event) => event);
  }
}

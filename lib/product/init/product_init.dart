// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mertali/main.dart';
import 'package:mertali/product/cache/product_cache_manager.dart';

@immutable
final class Init {
  Init() {
    init();
  }

  ProductStorageManager productStorageManager = ProductStorageManager();

  void init() async {
    final storedTheme = await ProductStorageManager.getTheme();

    runApp(
      ProviderScope(
        child: MyApp(
          theme: storedTheme ?? 'light',
        ),
      ),
    );
  }
}

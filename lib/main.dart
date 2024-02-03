
import 'package:flutter/material.dart';
import 'package:mertali/product/cache/product_cache_manager.dart';
import 'package:mertali/product/init/product_init.dart';
import 'package:mertali/screens/auth/presentation/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Init();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.theme});
  final String theme;
  @override
  State<MyApp> createState() => _MyAppState();

  static void setTheme(BuildContext context, bool isDark) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setTheme(isDark ? ThemeData.dark() : ThemeData.light());
  }
}

class _MyAppState extends State<MyApp> {
  ThemeData? _theme;

  setTheme(ThemeData theme) {
    setState(() {
      _theme = theme;
    });
  }

  listenTheme() async {
    final stream = ProductStorageManager.getThemeStream();
    stream.onData((data) {
      setTheme(ProductStorageManager.themeData(theme: data));
    });
  }

  @override
  void initState() {
    super.initState();
    listenTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const LoginView(),
      debugShowCheckedModeBanner: false,
      theme: _theme ?? ThemeData.light(),
    );
  }
}

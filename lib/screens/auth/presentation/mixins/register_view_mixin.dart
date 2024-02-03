import 'package:flutter/material.dart';
import 'package:mertali/product/models/auth_request.dart';
import 'package:mertali/product/navigator.dart';
import 'package:mertali/screens/auth/presentation/controller/auth_manager.dart';
import 'package:mertali/screens/auth/presentation/login_view.dart';
import 'package:mertali/screens/auth/presentation/register_view.dart';

mixin RegisterViewMixin on State<RegisterView> {
  final emailController = TextEditingController(text: "eve.holt@reqres.in");
  final passwordController = TextEditingController();

  final AuthManager authManager = AuthManager();
  @override
  void initState() {
    super.initState();
  }

  checkUserTile() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final response = await authManager.register(
        AuthRequest(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      if (response) {
        nextPage();
      }
      return;
    } else {
      return;
    }
  }

  void nextPage() {
    PNavigator.nextPageAndRemoveUntil(
      context,
      const LoginView(),
    );
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mertali/product/models/auth_request.dart';
import 'package:mertali/product/service/product_service_constants.dart';
import 'package:mertali/screens/auth/data/auth_repository.dart';

class AuthManager {
  final AuthRepository _authRepository = AuthRepository(
    dio: Dio(
      BaseOptions(
        baseUrl: ProductServiceConstants.baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    ),
  );
  Future<bool> register(AuthRequest authRequest) async {
    try {
      final response = await _authRepository.register(authRequest);

      if (response.error != null) {
        Fluttertoast.showToast(msg: "Error: ${response.error}");
        return false;
      } else {
        Fluttertoast.showToast(msg: "Success: ${response.token}");
        return true;
      }
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: "Error: $e");
      return false;
    }
  }

  Future<bool> login(AuthRequest authRequest) async {
    try {
      final response = await _authRepository.login(authRequest);

      if (response.error != null) {
        Fluttertoast.showToast(msg: "Error: ${response.error}");
        return false;
      } else {
        Fluttertoast.showToast(msg: "Success: ${response.token}");
        return true;
      }
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: "Error: $e");
      return false;
    }
  }
}

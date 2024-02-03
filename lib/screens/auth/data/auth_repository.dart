import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mertali/product/models/auth_request.dart';
import 'package:mertali/product/models/auth_response.dart';
import 'package:mertali/product/service/product_service_path.dart';

final class AuthRepository {
  AuthRepository({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<AuthResponse> register(AuthRequest authRequest) async {
    log('register: ${authRequest.toJson()}');
    log(_dio.options.baseUrl + ProductServicePath.register.value);
    final response = await _dio.post(
      ProductServicePath.register.value,
      data: authRequest.toJson(),
    );
    log('register: ${response.data}');
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> login(AuthRequest authRequest) {
    log('login: ${authRequest.toJson()}');
    return _dio
        .post(
          ProductServicePath.login.value,
          data: authRequest.toJson(),
        )
        .then(
          (response) => AuthResponse.fromJson(response.data),
        );
  }
}

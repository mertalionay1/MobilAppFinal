import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mertali/product/models/user.dart';
import 'package:mertali/product/service/product_service_path.dart';

class HomeRepository {
  HomeRepository({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  Future<User?> getProfile() async {
    try {
      final response = await _dio.get(
        ProductServicePath.user.withQuery('2'),
      );
      log('getProfile: ${response.data}');
      return User.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

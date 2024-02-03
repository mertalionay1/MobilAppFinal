import 'package:dio/dio.dart';
import 'package:mertali/product/models/user.dart';
import 'package:mertali/screens/home/data/home_repository.dart';

class HomeManager {
  final HomeRepository _homeRepository = HomeRepository(
    dio: Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    ),
  );

  Future<User> getProfile() async {
    return await _homeRepository.getProfile() ??
        User(id: null, email: '', firstName: '', lastName: '', avatar: '');
  }
}

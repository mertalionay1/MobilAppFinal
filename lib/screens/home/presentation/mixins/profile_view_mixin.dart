import 'package:flutter/material.dart';
import 'package:mertali/product/models/user.dart';
import 'package:mertali/screens/home/presentation/controller/home_manager.dart';
import 'package:mertali/screens/home/presentation/profile_view.dart';

mixin ProfileViewMixin on State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  HomeManager get homeManager => HomeManager();

  Future<User> getProfileItems() {
    return homeManager.getProfile();
  }
}

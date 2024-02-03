// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
final class AuthRequest {
  String? email;
  String? password;

  AuthRequest({
    required this.email,
    required this.password,
  });

  factory AuthRequest.fromJson(Map<String, dynamic> json) {
    return AuthRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': "$email",
      'password': "$password",
    };
  }
}

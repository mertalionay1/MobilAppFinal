// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
final class AuthResponse {
  int? id;
  String? token;
  String? error;

  AuthResponse({
    required this.id,
    required this.token,
    this.error,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      id: json['id'],
      token: json['token'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
    };
  }
}

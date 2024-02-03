// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
final class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['data']['id'],
      email: json['data']['email'],
      firstName: json['data']['first_name'],
      lastName: json['data']['last_name'],
      avatar: json['data']['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}

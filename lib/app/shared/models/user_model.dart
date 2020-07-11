import 'package:flutter/material.dart';

class UserModel {
  String login;
  String password;
  String name;
  bool isLoggedIn;

  UserModel({
    @required this.login,
    @required this.password,
    @required this.name,
    this.isLoggedIn = false,
  });

  copyWith({
    String login,
    String password,
    String name,
    bool isLoggedIn,
  }) {
    return UserModel(
      login: login ?? this.login,
      password: password ?? this.password,
      name: name ?? this.name,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

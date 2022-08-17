import 'dart:convert';

import '../../domain/entities/auth_info.dart';

class LoginInfo extends AuthInfo {
  LoginInfo({
    required String email,
    required String password,
  }) : super(email: email, password: password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginInfo.fromMap(Map<String, dynamic> map) {
    return LoginInfo(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginInfo.fromJson(String source) =>
      LoginInfo.fromMap(json.decode(source));
}

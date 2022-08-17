import 'dart:convert';

import '../../domain/entities/auth_info.dart';

class RegisterInfo extends AuthInfo {
  final String firstName;
  final String lastName;
  RegisterInfo({
    required String email,
    required String password,
    required this.firstName,
    required this.lastName,
  }) : super(email: email, password: password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory RegisterInfo.fromMap(Map<String, dynamic> map) {
    return RegisterInfo(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterInfo.fromJson(String source) =>
      RegisterInfo.fromMap(json.decode(source));
}

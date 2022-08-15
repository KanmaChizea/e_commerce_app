import 'dart:convert';

class LoginInfo {
  final String email;
  final String password;
  LoginInfo({
    required this.email,
    required this.password,
  });

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

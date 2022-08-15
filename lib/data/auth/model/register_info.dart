import 'dart:convert';

class RegisterInfo {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  RegisterInfo({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

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

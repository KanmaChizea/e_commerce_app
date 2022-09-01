import 'package:equatable/equatable.dart';

class SettingEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final bool gender;
  final String phoneNo;
  const SettingEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phoneNo,
  });

  SettingEntity copyWith({
    String? firstName,
    String? lastName,
    String? email,
    bool? gender,
    String? phoneNo,
  }) {
    return SettingEntity(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'phoneNo': phoneNo,
    };
  }

  factory SettingEntity.fromMap(Map<String, dynamic> map) {
    return SettingEntity(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? false,
      phoneNo: map['phoneNo'] ?? '',
    );
  }

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      email,
      gender,
      phoneNo,
    ];
  }
}

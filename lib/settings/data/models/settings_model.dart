import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_commerce_app/settings/domain/entity/setting_entity.dart';

class SettingsModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final bool gender;
  final String phoneNo;
  const SettingsModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phoneNo,
  });
  @override
  List<Object?> get props => [];

  SettingsModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    bool? gender,
    String? phoneNo,
  }) {
    return SettingsModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  factory SettingsModel.fromFirebase(User user, DocumentSnapshot snapshot) {
    final names = user.displayName?.split(' ') ?? [];
    return SettingsModel(
        firstName: names[0],
        lastName: names[1],
        email: user.email ?? '',
        gender: snapshot['gender'] ?? true,
        phoneNo: snapshot['phone'] ?? '');
  }

  SettingEntity toEntity() {
    return SettingEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        phoneNo: phoneNo);
  }
}

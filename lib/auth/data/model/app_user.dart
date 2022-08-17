import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/app_user.dart';

class AppUser extends UserEntity {
  const AppUser({
    required String firstName,
    required String lastName,
    required String email,
    required String avatarURL,
  }) : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            avatarURL: avatarURL);

  AppUser copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? avatarURL,
  }) {
    return AppUser(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      avatarURL: avatarURL ?? this.avatarURL,
    );
  }

  factory AppUser.fromUser(User user) {
    final names = user.displayName?.split(' ') ?? [];
    return AppUser(
      firstName: names[0],
      lastName: names[1],
      email: user.email ?? '',
      avatarURL: user.photoURL ?? '',
    );
  }
}

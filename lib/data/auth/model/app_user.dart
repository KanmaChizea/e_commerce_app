import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUser extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String avatarURL;
  const AppUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarURL,
  });

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

  @override
  List<Object?> get props => [email];
}

abstract class UserEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String avatarURL;

  const UserEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarURL,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.avatarURL == avatarURL;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        avatarURL.hashCode;
  }
}

part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettings extends SettingsEvent {}

class EmitSettings extends SettingsEvent {
  final SettingEntity settings;

  const EmitSettings(this.settings);

  @override
  List<Object> get props => [settings];
}

class SetName extends SettingsEvent {
  final String firstName;
  final String lastName;
  const SetName({
    required this.firstName,
    required this.lastName,
  });
  @override
  List<Object> get props => [firstName, lastName];
}

class SetEmail extends SettingsEvent {
  final String email;
  const SetEmail(
    this.email,
  );

  @override
  List<Object> get props => [email];
}

class SetPhone extends SettingsEvent {
  final String phone;
  const SetPhone(
    this.phone,
  );

  @override
  List<Object> get props => [phone];
}

class SetGender extends SettingsEvent {
  final bool isFemale;
  const SetGender(
    this.isFemale,
  );

  @override
  List<Object> get props => [isFemale];
}

class ChangePassword extends SettingsEvent {
  final String email;
  final String currentPassword;
  final String newPassword;
  const ChangePassword({
    required this.email,
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [email, currentPassword, newPassword];
}

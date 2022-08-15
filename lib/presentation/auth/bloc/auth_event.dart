part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckLoginStatus extends AuthEvent {}

class ToggleToRegister extends AuthEvent {}

class ToggleToLogin extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final LoginInfo loginInfo;
  const AuthLogin(
    this.loginInfo,
  );
}

class AuthLogout extends AuthEvent {}

class AuthRegister extends AuthEvent {
  final RegisterInfo registerInfo;
  const AuthRegister(
    this.registerInfo,
  );
}

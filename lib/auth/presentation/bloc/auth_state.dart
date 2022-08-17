part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  final bool isLogin;
  final bool isLoading;
  final bool isError;
  final Failure? failure;
  const AuthInitial(this.isLogin, this.isLoading, this.isError, [this.failure]);

  @override
  List<Object> get props => [isLogin, isLogin, isError];
}

class AuthLoggedIn extends AuthState {
  final AppUser user;
  const AuthLoggedIn({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

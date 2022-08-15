import '../../../core/error/failures.dart';

import '../../../data/auth/model/login_info.dart';
import '../../../data/auth/model/register_info.dart';
import 'package:equatable/equatable.dart';

import '../../../data/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/auth/model/app_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(
    this.authRepository,
  ) : super(const AuthInitial(true, false, false)) {
    on<CheckLoginStatus>(_oncheckLoginStatus);
    on<AuthLogin>(_onAuthLogin);
    on<AuthLogout>(_onAuthLogout);
    on<AuthRegister>(_onAuthRegister);
    on<ToggleToRegister>(_onToggleToRegister);
    on<ToggleToLogin>(_onToggleToLogin);
  }

  Future<void> _oncheckLoginStatus(
      CheckLoginStatus event, Emitter<AuthState> emit) async {
    final user = authRepository.fetchUser();
    if (user == null) {
      emit(const AuthInitial(true, false, false));
    } else {
      emit(AuthLoggedIn(user: user));
    }
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(true, true, false));
    final result = await authRepository.login(event.loginInfo);
    emit(result.fold((l) => AuthInitial(true, false, true, l),
        (r) => AuthLoggedIn(user: r)));
  }

  Future<void> _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(const AuthInitial(true, false, false));
  }

  Future<void> _onAuthRegister(
      AuthRegister event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(false, true, false));

    final result = await authRepository.register(event.registerInfo);
    emit(result.fold((l) => AuthInitial(false, false, true, l),
        (r) => AuthLoggedIn(user: r)));
  }

  Future<void> _onToggleToRegister(
      ToggleToRegister event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(false, false, false));
  }

  Future<void> _onToggleToLogin(
      ToggleToLogin event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(true, false, false));
  }
}

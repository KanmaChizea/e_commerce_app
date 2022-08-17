import '../../domain/usecase/auth_status.dart';
import '../../domain/usecase/register.dart';
import '../../domain/usecase/sign_in.dart';
import '../../domain/usecase/sign_out.dart';

import '../../../core/error/failures.dart';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/app_user.dart';
import '../../data/model/login_info.dart';
import '../../data/model/register_info.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {required UserSignIn userSignIn,
      required UserRegister userRegister,
      required UserSignOut userSignOut,
      required UserAuthStatus userAuthStatus})
      : _userAuthStatus = userAuthStatus,
        _userRegister = userRegister,
        _userSignIn = userSignIn,
        _userSignOut = userSignOut,
        super(const AuthInitial(true, false, false)) {
    on<CheckLoginStatus>(_oncheckLoginStatus);
    on<AuthLogin>(_onAuthLogin);
    on<AuthLogout>(_onAuthLogout);
    on<AuthRegister>(_onAuthRegister);
    on<ToggleToRegister>(_onToggleToRegister);
    on<ToggleToLogin>(_onToggleToLogin);
  }

  final UserAuthStatus _userAuthStatus;
  final UserRegister _userRegister;
  final UserSignIn _userSignIn;
  final UserSignOut _userSignOut;

  Future<void> _oncheckLoginStatus(
      CheckLoginStatus event, Emitter<AuthState> emit) async {
    final user = _userAuthStatus.call();
    if (user == null) {
      emit(const AuthInitial(true, false, false));
    } else {
      emit(AuthLoggedIn(user: user));
    }
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(true, true, false));
    final result = await _userSignIn(event.loginInfo);
    emit(result.fold((l) => AuthInitial(true, false, true, l),
        (r) => AuthLoggedIn(user: r)));
  }

  Future<void> _onAuthLogout(AuthLogout event, Emitter<AuthState> emit) async {
    await _userSignOut.call();
    emit(const AuthInitial(true, false, false));
  }

  Future<void> _onAuthRegister(
      AuthRegister event, Emitter<AuthState> emit) async {
    emit(const AuthInitial(false, true, false));

    final result = await _userRegister(event.registerInfo);
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

import 'package:e_commerce_app/auth/data/repository/auth_repository.dart';
import 'package:e_commerce_app/auth/data/source/auth_service.dart';
import 'package:e_commerce_app/auth/domain/repository/auth_repo_interface.dart';
import 'package:e_commerce_app/auth/domain/usecase/auth_status.dart';
import 'package:e_commerce_app/auth/domain/usecase/register.dart';
import 'package:e_commerce_app/auth/domain/usecase/sign_in.dart';
import 'package:e_commerce_app/auth/domain/usecase/sign_out.dart';
import 'package:get_it/get_it.dart';

import 'presentation/bloc/auth_bloc.dart';

final _sl = GetIt.instance;

void init() {
  //bloc
  _sl.registerFactory(() => AuthBloc(
      userAuthStatus: _sl(),
      userRegister: _sl(),
      userSignIn: _sl(),
      userSignOut: _sl()));

  //use case
  _sl.registerLazySingleton(() => UserAuthStatus(authRepository: _sl()));
  _sl.registerLazySingleton(() => UserSignIn(authRepository: _sl()));
  _sl.registerLazySingleton(() => UserSignOut(authRepository: _sl()));
  _sl.registerLazySingleton(() => UserRegister(authRepository: _sl()));

  //repository
  _sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(authService: _sl()));

  //data sources
  _sl.registerLazySingleton<IAuthService>(() => AuthService());
}

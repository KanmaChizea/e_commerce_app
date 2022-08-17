import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/repository/auth_repo_interface.dart';
import '../model/app_user.dart';
import '../model/login_info.dart';
import '../model/register_info.dart';
import '../source/auth_service.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({required IAuthService authService})
      : _authService = authService;

  final IAuthService _authService;

  @override
  Future<Either<Failure, AppUser>> register(RegisterInfo regInfo) async {
    try {
      await _authService.register(regInfo);
      final result = _authService.fetchUser;

      final toAppUser = AppUser.fromUser(result!);
      return Right(toAppUser);
    } on AuthFailedException catch (e) {
      return Left(Failure(e.code));
    }
  }

  @override
  Future<Either<Failure, AppUser>> login(LoginInfo loginInfo) async {
    try {
      final result = await _authService.login(loginInfo);
      final toAppUser = AppUser.fromUser(result!);
      return Right(toAppUser);
    } on AuthFailedException catch (e) {
      return Left(Failure(e.code));
    }
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }

  @override
  AppUser? fetchUser() {
    final firebaseUser = _authService.fetchUser;
    return firebaseUser != null ? AppUser.fromUser(firebaseUser) : null;
  }
}

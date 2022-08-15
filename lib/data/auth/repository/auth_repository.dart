import 'package:dartz/dartz.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../model/app_user.dart';
import '../model/login_info.dart';
import '../source/auth_service.dart';

import '../model/register_info.dart';

class AuthRepository {
  final AuthService authService;
  AuthRepository(
    this.authService,
  );

  Future<Either<Failure, AppUser>> register(RegisterInfo regInfo) async {
    try {
      final result = await authService.register(regInfo);
      final toAppUser = AppUser.fromUser(result!);
      return Right(toAppUser);
    } on AuthFailedException catch (e) {
      return Left(Failure(e.code));
    }
  }

  Future<Either<Failure, AppUser>> login(LoginInfo loginInfo) async {
    try {
      final result = await authService.login(loginInfo);
      final toAppUser = AppUser.fromUser(result!);
      return Right(toAppUser);
    } on AuthFailedException catch (e) {
      return Left(Failure(e.code));
    }
  }

  Future<void> logout() async {
    await authService.logout();
  }

  AppUser? fetchUser() {
    final firebaseUser = authService.fetchUser;
    return firebaseUser != null ? AppUser.fromUser(firebaseUser) : null;
  }
}

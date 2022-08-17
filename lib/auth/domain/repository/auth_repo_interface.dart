import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/model/app_user.dart';
import '../../data/model/login_info.dart';
import '../../data/model/register_info.dart';

abstract class IAuthRepository {
  Future<Either<Failure, AppUser>> register(RegisterInfo regInfo);
  Future<Either<Failure, AppUser>> login(LoginInfo loginInfo);
  Future<void> logout();
  AppUser? fetchUser();
}

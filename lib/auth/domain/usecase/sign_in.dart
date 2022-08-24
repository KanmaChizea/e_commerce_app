import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/model/app_user.dart';
import '../../data/model/login_info.dart';
import '../repository/auth_repo_interface.dart';

class UserSignIn {
  const UserSignIn({required IAuthRepository authRepository})
      : _authRepo = authRepository;
  final IAuthRepository _authRepo;

  Future<Either<Failure, AppUser>> call(LoginInfo loginInfo) async {
    return await _authRepo.login(loginInfo);
  }
}

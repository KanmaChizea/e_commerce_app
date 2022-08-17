import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/model/app_user.dart';
import '../../data/model/register_info.dart';
import '../repository/auth_repo_interface.dart';

class UserRegister {
  const UserRegister({required IAuthRepository authRepository})
      : _authRepo = authRepository;
  final IAuthRepository _authRepo;

  Future<Either<Failure, AppUser>> call(RegisterInfo registerInfo) async {
    return await _authRepo.register(registerInfo);
  }
}

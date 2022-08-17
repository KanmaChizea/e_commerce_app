import 'package:dartz/dartz.dart';
import '../../auth/data/model/app_user.dart';

import '../../auth/domain/entities/auth_info.dart';
import '../error/failures.dart';

abstract class AuthUseCase {
  Future<Either<Failure, AppUser>> call(AuthInfo authInfo);
}

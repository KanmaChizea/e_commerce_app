import '../../data/model/app_user.dart';
import '../repository/auth_repo_interface.dart';

class UserAuthStatus {
  const UserAuthStatus({required IAuthRepository authRepository})
      : _authRepo = authRepository;
  final IAuthRepository _authRepo;

  AppUser? call() {
    return _authRepo.fetchUser();
  }
}

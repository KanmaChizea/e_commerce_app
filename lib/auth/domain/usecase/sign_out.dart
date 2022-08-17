import '../repository/auth_repo_interface.dart';

class UserSignOut {
  const UserSignOut({required IAuthRepository authRepository})
      : _authRepo = authRepository;
  final IAuthRepository _authRepo;

  Future<void> call() async {
    return await _authRepo.logout();
  }
}

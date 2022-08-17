import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exceptions.dart';
import '../model/login_info.dart';
import '../model/register_info.dart';

abstract class IAuthService {
  Future<User?> register(RegisterInfo registerInfo);
  Future<User?> login(LoginInfo loginInfo);
  Future<void> logout();
  User? get fetchUser;
}

class AuthService implements IAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<User?> register(RegisterInfo registerInfo) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: registerInfo.email, password: registerInfo.password);
      await user.user?.updateDisplayName(
          '${registerInfo.firstName} ${registerInfo.lastName}');
      return user.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailedException(code: e.code, message: e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> login(LoginInfo loginInfo) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: loginInfo.email, password: loginInfo.password);
      return user.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailedException(code: e.code, message: e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  User? get fetchUser {
    return _auth.currentUser;
  }
}

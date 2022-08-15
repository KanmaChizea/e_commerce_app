import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exceptions.dart';
import '../model/login_info.dart';
import '../model/register_info.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> register(RegisterInfo registerInfo) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: registerInfo.email, password: registerInfo.password);
      await updateDisplayName(registerInfo.firstName, registerInfo.lastName);
      return user.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailedException(code: e.code, message: e.message);
    } catch (e) {
      rethrow;
    }
  }

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

  Future<void> logout() async {
    await _auth.signOut();
  }

  User? get fetchUser {
    return _auth.currentUser;
  }

  Future<void> updateDisplayName(String firstName, String lastName) async {
    await _auth.currentUser?.updateDisplayName('$firstName + ' ' + $lastName');
  }

  Future<void> updateEmail(String email) async {
    await _auth.currentUser?.updateEmail(email);
  }

  Future<void> updateAvatar(String urL) async {
    await _auth.currentUser?.updatePhotoURL(urL);
  }

  Future<void> updatePassword(String email, String password) async {
    final credential =
        EmailAuthProvider.credential(email: email, password: password);
    await _auth.currentUser?.reauthenticateWithCredential(credential);
    await _auth.currentUser?.updatePassword(password);
  }
}

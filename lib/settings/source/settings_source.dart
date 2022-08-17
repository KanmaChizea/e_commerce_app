import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

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

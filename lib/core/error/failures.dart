import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String code;
  final String message;
  Failure(
    this.code,
  ) : message = decode(code);

  static decode(String code) {
    switch (code) {
      case 'auth/email-already-exists':
        return 'This user already exists';
      case 'auth/session-cookie-expired':
        return 'Time out. Your session is taking too long';
      case 'auth/user-not-found':
        return 'User does not exist';
      case 'auth/invalid-argument':
        return 'The username and/or password you entered is incorrect';
      default:
        return 'Something went wrong';
    }
  }

  @override
  List<Object?> get props => [code];
}

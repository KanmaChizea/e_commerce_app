import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String code;
  final String message;
  Failure(
    this.code,
  ) : message = decode(code);

  static decode(String code) {
    switch (code) {
      case 'email-already-exists':
      case 'email-already-in-use':
        return 'This user already exists';

      case 'session-cookie-expired':
        return 'Time out. Your session is taking too long';
      case 'user-not-found':
        return 'User does not exist';
      case 'invalid-argument':
        return 'The username and/or password you entered is incorrect';
      default:
        return 'Something went wrong';
    }
  }

  @override
  List<Object?> get props => [code];
}

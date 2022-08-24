import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Could not fetch data');
}

class AuthFailure extends Failure {
  final String code;
  AuthFailure({required this.code}) : super(decode(code));

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
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('Something went wrong');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('Please connect to the internet and try again');
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/model/app_user.dart';
import 'package:e_commerce_app/data/auth/model/login_info.dart';
import 'package:e_commerce_app/data/auth/model/register_info.dart';
import 'package:e_commerce_app/data/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthBloc sut;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    sut = AuthBloc(mockAuthRepository);
  });

  const user = AppUser(
      firstName: 'tfirstName',
      lastName: 'tlastName',
      email: 'temail',
      avatarURL: 'tavatarURL');
  RegisterInfo regInfo = RegisterInfo(
      email: 'testemail',
      password: 'testpassword',
      firstName: 'testfirstName',
      lastName: 'testlastName');

  LoginInfo loginInfo = LoginInfo(email: 'testemail', password: 'testpassword');

  group('handles the bloc events appropriately', () {
    test(
      "checks login status",
      () async {
        when(() => mockAuthRepository.fetchUser()).thenAnswer((_) => null);
        sut.add(CheckLoginStatus());
        expect(
            sut.stream, emitsInOrder([const AuthInitial(true, false, false)]));
      },
    );

    test(
      "logs in user and emits auth logged in state",
      () async {
        when(() => mockAuthRepository.login(loginInfo))
            .thenAnswer((_) async => const Right(user));
        sut.add(AuthLogin(loginInfo));
        expect(
            sut.stream,
            emitsInOrder([
              const AuthInitial(true, true, false),
              const AuthLoggedIn(user: user)
            ]));
      },
    );

    test(
      "registers user and emits auth logged in state",
      () async {
        when(() => mockAuthRepository.register(regInfo))
            .thenAnswer((_) async => const Right(user));
        sut.add(AuthRegister(regInfo));
        expect(
            sut.stream,
            emitsInOrder([
              const AuthInitial(false, true, false),
              const AuthLoggedIn(user: user)
            ]));
      },
    );
  });
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/auth/data/model/app_user.dart';
import 'package:e_commerce_app/auth/data/model/login_info.dart';
import 'package:e_commerce_app/auth/data/model/register_info.dart';
import 'package:e_commerce_app/auth/domain/usecase/auth_status.dart';
import 'package:e_commerce_app/auth/domain/usecase/register.dart';
import 'package:e_commerce_app/auth/domain/usecase/sign_in.dart';
import 'package:e_commerce_app/auth/domain/usecase/sign_out.dart';
import 'package:e_commerce_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSignIn extends Mock implements UserSignIn {}

class MockUserSignOut extends Mock implements UserSignOut {}

class MockUserRegister extends Mock implements UserRegister {}

class MockUserAuthStatus extends Mock implements UserAuthStatus {}

void main() {
  late AuthBloc sut;
  late MockUserRegister mockUserRegister;
  late MockUserSignIn mockUserSignIn;
  late MockUserSignOut mockUserSignOut;
  late MockUserAuthStatus mockUserAuthStatus;

  setUp(() {
    mockUserAuthStatus = MockUserAuthStatus();
    mockUserRegister = MockUserRegister();
    mockUserSignIn = MockUserSignIn();
    mockUserSignOut = MockUserSignOut();
    sut = AuthBloc(
        userAuthStatus: mockUserAuthStatus,
        userRegister: mockUserRegister,
        userSignIn: mockUserSignIn,
        userSignOut: mockUserSignOut);
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
        when(() => mockUserAuthStatus.call()).thenAnswer((_) => null);
        sut.add(CheckLoginStatus());
        expect(
            sut.stream, emitsInOrder([const AuthInitial(true, false, false)]));
      },
    );

    test(
      "logs in user and emits auth logged in state",
      () async {
        when(() => mockUserSignIn.call(loginInfo))
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
        when(() => mockUserRegister.call(regInfo))
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

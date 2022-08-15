import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/data/auth/model/app_user.dart';
import 'package:e_commerce_app/data/auth/model/login_info.dart';
import 'package:e_commerce_app/data/auth/model/register_info.dart';
import 'package:e_commerce_app/data/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/data/auth/source/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthService {}

class FakeUser extends Fake implements User {
  @override
  String displayName = 'testfirstName testLastName';
  @override
  String email = 'testemail';
  @override
  String photoURL = 'testURL';
}

void main() {
  late AuthRepository sut;
  late MockAuthService mockAuthService;
  late FakeUser user;

  setUp(() {
    mockAuthService = MockAuthService();
    sut = AuthRepository(mockAuthService);
    user = FakeUser();
  });

  RegisterInfo regInfo = RegisterInfo(
      email: 'testemail',
      password: 'testpassword',
      firstName: 'testfirstName',
      lastName: 'testlastName');

  LoginInfo loginInfo = LoginInfo(email: 'testemail', password: 'testpassword');

  Future<Either<Failure, AppUser>> arrangeAndActRegistration() async {
    when(() => mockAuthService.register(regInfo)).thenAnswer((_) async => user);
    return await sut.register(regInfo);
  }

  Future<Either<Failure, AppUser>> arrangeAndActLogin() async {
    when(() => mockAuthService.login(loginInfo)).thenAnswer((_) async => user);
    return await sut.login(loginInfo);
  }

  void arrangeAndActLogout() async {
    when(() => mockAuthService.logout()).thenAnswer((_) async {});
    await sut.logout();
  }

  Future<AppUser?> arrangeAndActFetchUser() async {
    when(() => mockAuthService.fetchUser).thenAnswer((_) => user);
    return sut.fetchUser();
  }

  group('uses auth service', () {
    test(
      "calls register method",
      () async {
        arrangeAndActRegistration();
        verify(() => mockAuthService.register(regInfo)).called(1);
      },
    );

    test(
      "calls login method",
      () async {
        arrangeAndActLogin();
        verify(() => mockAuthService.login(loginInfo)).called(1);
      },
    );

    test(
      "calls logout method",
      () async {
        arrangeAndActLogout();
        verify(() => mockAuthService.logout()).called(1);
      },
    );

    test(
      "calls fetch user method",
      () async {
        arrangeAndActFetchUser();
        verify(() => mockAuthService.fetchUser).called(1);
      },
    );
  });

  group("each method carries out its functions", () {
    test(
      "registers user and returns app user",
      () async {
        final result = await arrangeAndActRegistration();
        expect(result, Right(AppUser.fromUser(user)));
      },
    );

    test(
      "signs in user and returns app user",
      () async {
        final result = await arrangeAndActLogin();
        expect(result, Right(AppUser.fromUser(user)));
      },
    );

    test(
      "fetches firebase user and returns app user",
      () async {
        final result = await arrangeAndActFetchUser();
        expect(result, AppUser.fromUser(user));
      },
    );
  });
}

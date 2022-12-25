import 'package:e_commerce_app/settings/domain/usecases/change_password_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/get_settings_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_email_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_gender_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_name_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_phone_usecase.dart';
import 'package:e_commerce_app/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetSettingsUseCase extends Mock implements GetSettingsUseCase {}

class MockChangePasswordUseCase extends Mock implements ChangePasswordUseCase {}

class MockSetEmailUseCase extends Mock implements SetEmailUseCase {}

class MockSetGenderUseCase extends Mock implements SetGenderUseCase {}

class MockSetPhoneUseCase extends Mock implements SetPhoneUseCase {}

class MockSetNameUseCase extends Mock implements SetNameUseCase {}

void main() {
  late SettingsBloc sut;
  late MockChangePasswordUseCase mockChangePassword;
  late MockGetSettingsUseCase mockGetSettings;
  late MockSetEmailUseCase mockSetEmail;
  late MockSetGenderUseCase mockSetGender;
  late MockSetNameUseCase mockSetName;
  late MockSetPhoneUseCase mockSetPhone;

  setUp(() {
    mockSetEmail = MockSetEmailUseCase();
    mockSetGender = MockSetGenderUseCase();
    mockSetName = MockSetNameUseCase();
    mockSetPhone = MockSetPhoneUseCase();
    mockChangePassword = MockChangePasswordUseCase();
    mockGetSettings = MockGetSettingsUseCase();
    sut = SettingsBloc(
        setEmailUseCase: mockSetEmail,
        setGenderUseCase: mockSetGender,
        setNameUseCase: mockSetName,
        setPhoneUseCase: mockSetPhone,
        getSettingsUseCase: mockGetSettings,
        changePasswordUseCase: mockChangePassword);
  });

  group('', () {});
}

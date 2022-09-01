import 'package:e_commerce_app/settings/data/repository/settings_repository.dart';
import 'package:e_commerce_app/settings/data/source/settings_source.dart';
import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';
import 'package:e_commerce_app/settings/domain/usecases/add_address_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/change_password_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/get_address_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/get_settings_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_email_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_gender_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_name_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_phone_usecase.dart';
import 'package:e_commerce_app/settings/presentation/bloc/address_bloc.dart';
import 'package:e_commerce_app/settings/presentation/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

import 'domain/usecases/delette_address_usecase.dart';

final _sl = GetIt.instance;

void init() {
  _sl.registerFactory(() => SettingsBloc(
        getSettingsUseCase: _sl(),
        changePasswordUseCase: _sl(),
        setEmailUseCase: _sl(),
        setGenderUseCase: _sl(),
        setNameUseCase: _sl(),
        setPhoneUseCase: _sl(),
      ));
  _sl.registerFactory(() => AddressBloc(
      addAddressUseCase: _sl(),
      getAddressUseCase: _sl(),
      deleteAddressUseCase: _sl()));

  _sl.registerLazySingleton(() => GetSettingsUseCase(_sl()));
  _sl.registerLazySingleton(() => AddAddressUseCase(_sl()));
  _sl.registerLazySingleton(() => ChangePasswordUseCase(_sl()));
  _sl.registerLazySingleton(() => SetEmailUseCase(_sl()));
  _sl.registerLazySingleton(() => SetGenderUseCase(_sl()));
  _sl.registerLazySingleton(() => SetNameUseCase(_sl()));
  _sl.registerLazySingleton(() => SetPhoneUseCase(_sl()));
  _sl.registerLazySingleton(() => GetAddressUseCase(_sl()));
  _sl.registerLazySingleton(() => DeleteAddressUseCase(_sl()));

  _sl.registerLazySingleton<ISettingsRepository>(
      () => SettingsRepository(_sl()));
  _sl.registerLazySingleton<ISettingsDataSource>(() => SettingsDataSource());
}

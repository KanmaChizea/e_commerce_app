import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/settings/domain/entity/setting_entity.dart';
import 'package:e_commerce_app/settings/domain/usecases/change_password_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/get_settings_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_email_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_gender_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_name_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/set_phone_usecase.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingEntity> {
  SettingsBloc({
    required GetSettingsUseCase getSettingsUseCase,
    required ChangePasswordUseCase changePasswordUseCase,
    required SetEmailUseCase setEmailUseCase,
    required SetGenderUseCase setGenderUseCase,
    required SetNameUseCase setNameUseCase,
    required SetPhoneUseCase setPhoneUseCase,
  })  : _getSettingsUseCase = getSettingsUseCase,
        _changePasswordUseCase = changePasswordUseCase,
        _setEmailUseCase = setEmailUseCase,
        _setGenderUseCase = setGenderUseCase,
        _setNameUseCase = setNameUseCase,
        _setPhoneUseCase = setPhoneUseCase,
        super(const SettingEntity(
            firstName: '',
            lastName: '',
            email: '',
            gender: false,
            phoneNo: '')) {
    on<LoadSettings>(_onLoadSettings);
    on<SetEmail>(_onSetEmail);
    on<SetGender>(_onSetGender);
    on<SetName>(_onSetName);
    on<SetPhone>(_onSetPhone);
    on<EmitSettings>(_onEmitSettings);
    on<ChangePassword>(_onChangePassword);
  }

  final GetSettingsUseCase _getSettingsUseCase;

  final ChangePasswordUseCase _changePasswordUseCase;
  final SetEmailUseCase _setEmailUseCase;
  final SetGenderUseCase _setGenderUseCase;
  final SetNameUseCase _setNameUseCase;
  final SetPhoneUseCase _setPhoneUseCase;
  late StreamSubscription<SettingEntity> _streamSubscription;

  _onLoadSettings(LoadSettings event, Emitter emit) {
    _streamSubscription = _getSettingsUseCase.call().listen((event) {
      add(EmitSettings(event));
    });
  }

  _onEmitSettings(EmitSettings event, Emitter emit) {
    emit(event.settings);
  }

  _onSetEmail(SetEmail event, Emitter emit) async {
    await _setEmailUseCase.call(event.email);
  }

  _onSetGender(SetGender event, Emitter emit) async {
    await _setGenderUseCase.call(event.isFemale);
  }

  _onSetName(SetName event, Emitter emit) async {
    await _setNameUseCase.call(event.firstName, event.lastName);
  }

  _onSetPhone(SetPhone event, Emitter emit) async {
    await _setPhoneUseCase.call(event.phone);
  }

  _onChangePassword(ChangePassword event, Emitter emit) async {
    await _changePasswordUseCase.call(
        event.email, event.currentPassword, event.newPassword);
  }

  @override
  void onChange(Change<SettingEntity> change) {
    log(change.nextState.toString());
    super.onChange(change);
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}

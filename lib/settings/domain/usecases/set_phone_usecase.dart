import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

class SetPhoneUseCase {
  SetPhoneUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Future<void> call(String phone) async {
    return await _settingsRepository.setPhone(phone);
  }
}

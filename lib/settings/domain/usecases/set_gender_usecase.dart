import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

class SetGenderUseCase {
  SetGenderUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Future<void> call(bool gender) async {
    return await _settingsRepository.setGender(gender);
  }
}

import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

class SetNameUseCase {
  SetNameUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Future<void> call(String firstName, String lastName) async {
    return await _settingsRepository.setName(firstName, lastName);
  }
}

import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

class SetEmailUseCase {
  SetEmailUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Future<void> call(String email) async {
    return await _settingsRepository.setEmail(email);
  }
}

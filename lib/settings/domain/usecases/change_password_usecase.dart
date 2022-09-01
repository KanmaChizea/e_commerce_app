import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

class ChangePasswordUseCase {
  ChangePasswordUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Future<void> call(
      String email, String currentPassword, String newPassword) async {
    return await _settingsRepository.changePassword(
        email, currentPassword, newPassword);
  }
}

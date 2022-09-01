import 'package:e_commerce_app/settings/domain/entity/setting_entity.dart';
import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

class GetSettingsUseCase {
  GetSettingsUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Stream<SettingEntity> call() {
    return _settingsRepository.getSettings();
  }
}

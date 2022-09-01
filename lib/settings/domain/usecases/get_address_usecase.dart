import '../entity/address_entity.dart';
import '../repository/settings_respository_interface.dart';

class GetAddressUseCase {
  GetAddressUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Stream<List<Address>> call() {
    return _settingsRepository.getAddress();
  }
}

import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

import '../entity/address_entity.dart';

class AddAddressUseCase {
  AddAddressUseCase(ISettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository;

  final ISettingsRepository _settingsRepository;

  Future<void> call(Address address) async {
    return await _settingsRepository.addAddress(address);
  }
}

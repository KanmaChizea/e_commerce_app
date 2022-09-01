import 'package:e_commerce_app/settings/domain/entity/setting_entity.dart';

import '../entity/address_entity.dart';

abstract class ISettingsRepository {
  Future<void> setName(String firstName, String lastName);
  Future<void> setEmail(String email);
  Future<void> setPhone(String phone);
  Future<void> setGender(bool isFemale);
  Future<void> addAddress(Address address);
  Future<void> deleteAddress(Address address);
  Future<void> changePassword(
      String email, String currentPassword, String newPassword);
  Stream<SettingEntity> getSettings();
  Stream<List<Address>> getAddress();
}

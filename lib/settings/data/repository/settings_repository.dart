import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/settings/data/source/settings_source.dart';
import 'package:e_commerce_app/settings/domain/entity/address_entity.dart';
import 'package:e_commerce_app/settings/domain/entity/setting_entity.dart';
import 'package:e_commerce_app/settings/domain/repository/settings_respository_interface.dart';

class SettingsRepository implements ISettingsRepository {
  const SettingsRepository(ISettingsDataSource settingsDataSource)
      : _settingsDataSource = settingsDataSource;
  final ISettingsDataSource _settingsDataSource;
  @override
  Future<void> changePassword(
      String email, String currentPassword, String newPassword) async {
    try {
      await _settingsDataSource.changePassword(
          email, currentPassword, newPassword);
    } on FirebaseException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Stream<SettingEntity> getSettings() {
    return _settingsDataSource.getSettings();
  }

  @override
  Future<void> setEmail(String email) async {
    try {
      await _settingsDataSource.setEmail(email);
    } on FirebaseException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> setName(String firstName, String lastName) async {
    try {
      await _settingsDataSource.setDisplayName(firstName, lastName);
    } on FirebaseException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> setPhone(String phone) async {
    try {
      await _settingsDataSource.setPhone(phone);
    } on FirebaseException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> setGender(bool isFemale) async {
    try {
      await _settingsDataSource.setGender(isFemale);
    } on FirebaseException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> addAddress(Address address) async {
    try {
      await _settingsDataSource.addAddress(address);
    } on FirebaseException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Stream<List<Address>> getAddress() {
    return _settingsDataSource.getAddress();
  }

  @override
  Future<void> deleteAddress(Address address) async {
    try {
      await _settingsDataSource.deleteAddress(address);
    } on FirebaseException catch (e) {
      log(e.code);
    } catch (e) {
      log(e.toString());
    }
  }
}

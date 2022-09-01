import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/settings/data/models/settings_model.dart';
import 'package:e_commerce_app/settings/domain/entity/setting_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/entity/address_entity.dart';
import '../models/address_model.dart';

abstract class ISettingsDataSource {
  Future<void> setDisplayName(String firstName, String lastName);
  Future<void> changePassword(
      String email, String currentPassword, String newPassword);
  Future<void> setEmail(String email);
  Future<void> setPhone(String phone);
  Future<void> setGender(bool isFemale);
  Future<void> addAddress(Address address);
  Future<void> deleteAddress(Address address);
  Stream<SettingEntity> getSettings();
  Stream<List<Address>> getAddress();
}

class SettingsDataSource implements ISettingsDataSource {
  final User? _user = FirebaseAuth.instance.currentUser;

  @override
  Stream<SettingEntity> getSettings() async* {
    try {
      Stream<User?> user = FirebaseAuth.instance.userChanges();

      Stream<DocumentSnapshot<Map>> snapshot = FirebaseFirestore.instance
          .collection('user data')
          .doc(_user?.uid)
          .snapshots();
      Stream<SettingEntity> merge =
          CombineLatestStream.combine2<User?, DocumentSnapshot, SettingEntity>(
              user, snapshot, (a, b) {
        return SettingsModel.fromFirebase(a!, b).toEntity();
      });

      yield* merge;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> setDisplayName(String firstName, String lastName) async {
    await _user?.updateDisplayName('$firstName $lastName');
  }

  @override
  Future<void> setEmail(String email) async {
    await _user?.updateEmail(email);
  }

  @override
  Future<void> setPhone(String phone) async {
    await FirebaseFirestore.instance
        .collection('user data')
        .doc(_user?.uid)
        .set({'phone': phone}, SetOptions(merge: true));
  }

  @override
  Future<void> changePassword(
      String email, String currentPassword, String newPassword) async {
    final credential =
        EmailAuthProvider.credential(email: email, password: currentPassword);
    await _user?.reauthenticateWithCredential(credential);
    await _user?.updatePassword(newPassword);
  }

  @override
  Future<void> setGender(bool isFemale) async {
    await FirebaseFirestore.instance
        .collection('user data')
        .doc(_user?.uid)
        .set({'gender': isFemale}, SetOptions(merge: true));
  }

  @override
  Stream<List<Address>> getAddress() {
    return FirebaseFirestore.instance
        .collection('address ${_user?.uid}')
        .snapshots()
        .map((collection) => collection.docs.map((e) {
              AddressModel address = AddressModel.fromFirebase(e);
              log(address.toString());
              return address.toEntity();
            }).toList());
  }

  @override
  Future<void> addAddress(Address address) async {
    await FirebaseFirestore.instance
        .collection('address ${_user?.uid}')
        .add(address.toMap());
  }

  @override
  Future<void> deleteAddress(Address address) async {
    final doc = await FirebaseFirestore.instance
        .collection('address ${_user?.uid}')
        .where('address', isEqualTo: address.address)
        .get()
        .then((value) => value.docs.map((e) => e.reference));
    for (var element in doc) {
      FirebaseFirestore.instance
          .collection('address ${_user?.uid}')
          .doc(element.id)
          .delete();
    }
  }
}

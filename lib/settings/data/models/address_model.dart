import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/address_entity.dart';

class AddressModel extends Equatable {
  final String firstName;
  final String lastName;
  final String address;
  final String no;
  const AddressModel({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.no,
  });

  @override
  List<Object> get props {
    return [
      address,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'no': no,
    };
  }

  factory AddressModel.fromFirebase(DocumentSnapshot map) {
    return AddressModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      address: map['address'] ?? '',
      no: map['no'] ?? '',
    );
  }

  Address toEntity() {
    return Address(
        firstName: firstName, lastName: lastName, address: address, no: no);
  }
}

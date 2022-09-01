import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String firstName;
  final String lastName;
  final String address;
  final String no;
  const Address({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.no,
  });
  @override
  List<Object?> get props => [address];

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'no': no,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      address: map['address'] ?? '',
      no: map['no'] ?? '',
    );
  }
}

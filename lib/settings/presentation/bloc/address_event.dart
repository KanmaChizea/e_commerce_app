part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class AddAddress extends AddressEvent {
  final Address address;
  const AddAddress(
    this.address,
  );

  @override
  List<Object> get props => [address];
}

class DeleteAddress extends AddressEvent {
  final Address address;
  const DeleteAddress(
    this.address,
  );

  @override
  List<Object> get props => [address];
}

class LoadAddress extends AddressEvent {}

class EmitAddress extends AddressEvent {
  final List<Address> address;
  const EmitAddress(
    this.address,
  );

  @override
  List<Object> get props => [address];
}

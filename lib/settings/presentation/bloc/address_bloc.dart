import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/address_entity.dart';
import '../../domain/usecases/add_address_usecase.dart';
import '../../domain/usecases/delette_address_usecase.dart';
import '../../domain/usecases/get_address_usecase.dart';

part 'address_event.dart';

class AddressBloc extends Bloc<AddressEvent, List<Address>> {
  AddressBloc(
      {required AddAddressUseCase addAddressUseCase,
      required DeleteAddressUseCase deleteAddressUseCase,
      required GetAddressUseCase getAddressUseCase})
      : _getAddressUseCase = getAddressUseCase,
        _addAddressUseCase = addAddressUseCase,
        _deleteAddressUseCase = deleteAddressUseCase,
        super(
            const [Address(firstName: '', lastName: '', address: '', no: '')]) {
    on<AddAddress>(_onAddAddress);
    on<LoadAddress>(_onLoadAddress);
    on<EmitAddress>(_onEmitAddress);
    on<DeleteAddress>(_onDeleteAddress);
  }

  final GetAddressUseCase _getAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;

  _onAddAddress(AddAddress event, Emitter emit) async {
    await _addAddressUseCase.call(event.address);
  }

  _onDeleteAddress(DeleteAddress event, Emitter emit) async {
    await _deleteAddressUseCase.call(event.address);
  }

  _onLoadAddress(LoadAddress event, Emitter emit) {
    _getAddressUseCase.call().listen((event) {
      add(EmitAddress(event));
    });
  }

  _onEmitAddress(EmitAddress event, Emitter emit) {
    emit(event.address);
  }
}

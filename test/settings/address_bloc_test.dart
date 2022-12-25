import 'package:e_commerce_app/settings/domain/entity/address_entity.dart';
import 'package:e_commerce_app/settings/domain/usecases/add_address_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/delette_address_usecase.dart';
import 'package:e_commerce_app/settings/domain/usecases/get_address_usecase.dart';
import 'package:e_commerce_app/settings/presentation/bloc/address_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../cart/cart_constants.dart';

class MockAddAddressUseCase extends Mock implements AddAddressUseCase {}

class MockDeleteAddressUseCase extends Mock implements DeleteAddressUseCase {}

class MockGetAddressUseCase extends Mock implements GetAddressUseCase {}

void main() {
  late AddressBloc sut;
  late MockAddAddressUseCase mockAdd;
  late MockDeleteAddressUseCase mockDelete;
  late MockGetAddressUseCase mockGet;

  setUp(() {
    mockAdd = MockAddAddressUseCase();
    mockDelete = MockDeleteAddressUseCase();
    mockGet = MockGetAddressUseCase();
    sut = AddressBloc(
        addAddressUseCase: mockAdd,
        deleteAddressUseCase: mockDelete,
        getAddressUseCase: mockGet);
  });

  const Address address = Address(
      firstName: 'firstName',
      lastName: 'lastName',
      address: 'address',
      no: 'no');

  Stream<List<Address>> addressStream = Stream.fromIterable([
    [address]
  ]);

  test(
    "add address event uses the use case",
    () async {
      when(() => mockAdd.call(address)).thenAnswer((_) async {});
      sut.add(const AddAddress(address));
      addDelay();
      verify(() => mockAdd.call(address)).called(1);
    },
  );

  test(
    "delete address event uses the use case",
    () async {
      when(() => mockDelete.call(address)).thenAnswer((_) async {});
      sut.add(const DeleteAddress(address));
      addDelay();
      verify(() => mockDelete.call(address)).called(1);
    },
  );
  group('get address event', () {
    test(
      "=uses the use case",
      () async {
        when(() => mockGet.call()).thenAnswer((_) => addressStream);
        sut.add(LoadAddress());
        addDelay();
        verify(() => mockGet.call()).called(1);
      },
    );

    test(
      "returns a list of address",
      () async {
        when(() => mockGet.call()).thenAnswer((_) => addressStream);
        sut.add(LoadAddress());
        await addDelay();
        expect(sut.state, [address]);
      },
    );
  });
}

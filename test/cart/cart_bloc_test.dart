import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/cart/domain/usecases/add_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/clear_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/decrease_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/increase_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/remove_usecase.dart';
import 'package:e_commerce_app/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'cart_constants.dart';

class MockGetCartUsecase extends Mock implements GetCartUsecase {}

class MockAddToCartUsecase extends Mock implements AddToCartUsecase {}

class MockRemoveFromCartUsecase extends Mock implements RemoveFromCartUsecase {}

class MockClearCartUsecase extends Mock implements ClearCartUsecase {}

class MockIncreaseQuantityUsecase extends Mock
    implements IncreaseQuantityUsecase {}

class MockDecreaseQuantityUsecase extends Mock
    implements DecreaseQuantityUsecase {}

void main() {
  late CartBloc sut;
  late MockAddToCartUsecase mockAdd;
  late MockClearCartUsecase mockClear;
  late MockDecreaseQuantityUsecase mockDecrease;
  late MockGetCartUsecase mockGet;
  late MockIncreaseQuantityUsecase mockIncrease;
  late MockRemoveFromCartUsecase mockRemove;

  setUp(() {
    mockDecrease = MockDecreaseQuantityUsecase();
    mockGet = MockGetCartUsecase();
    mockIncrease = MockIncreaseQuantityUsecase();
    mockRemove = MockRemoveFromCartUsecase();
    mockAdd = MockAddToCartUsecase();
    mockClear = MockClearCartUsecase();
    sut = CartBloc(
        addToCartUsecase: mockAdd,
        removeFromCartUsecase: mockRemove,
        decreaseQuantityUsecase: mockDecrease,
        increaseQuantityUsecase: mockIncrease,
        getCartUsecase: mockGet,
        clearCartUsecase: mockClear);
  });

  group('Use cases used by corresponding event', () {
    test(
      "get to cart",
      () async {
        when(() => mockGet.call()).thenAnswer((_) => Right(cartStream));
        sut.add(GetCart());
        await addDelay();
        verify(() => mockGet.call()).called(1);
      },
    );

    test(
      "add to cart",
      () async {
        when(() => mockAdd.call(cartItem)).thenAnswer((_) async => {});
        sut.add(const AddToCart(cartItem));
        await addDelay();
        verify(() => mockAdd.call(cartItem)).called(1);
      },
    );

    test(
      "remove from cart",
      () async {
        when(() => mockRemove.call(cartItem)).thenAnswer((_) async => {});
        sut.add(const RemoveFromCart(cartItem));
        await addDelay();
        verify(() => mockRemove.call(cartItem)).called(1);
      },
    );

    test(
      "clear cart",
      () async {
        when(() => mockClear.call()).thenAnswer((_) async => {});
        sut.add(ClearCart());
        await addDelay();
        verify(() => mockClear.call()).called(1);
      },
    );

    test(
      "increase quantity",
      () async {
        when(() => mockIncrease.call(cartItem)).thenAnswer((_) async => {});
        sut.add(const IncreaseQuantity(cartItem));
        await addDelay();
        verify(() => mockIncrease.call(cartItem)).called(1);
      },
    );

    test(
      "decrease item",
      () async {
        when(() => mockDecrease.call(cartItem)).thenAnswer((_) async => {});
        sut.add(const DecreaseQuantity(cartItem));
        await addDelay();
        verify(() => mockDecrease.call(cartItem)).called(1);
      },
    );
  });

  test(
    "get cart event emits list of cart event",
    () async {
      when(() => mockGet.call()).thenAnswer((_) => Right(cartStream));
      sut.add(GetCart());
      await addDelay();
      expect(sut.state, [cartItem]);
    },
  );
}

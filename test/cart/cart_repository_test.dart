import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/cart/data/repository/cart_repository.dart';
import 'package:e_commerce_app/cart/data/source/remote_cart_datasource.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'cart_constants.dart';

class MockDataScource extends Mock implements RemoteCartDataSource {}

void main() {
  late CartRepository sut;
  late MockDataScource mockDataScource;

  setUp(() {
    mockDataScource = MockDataScource();
    sut = CartRepository(mockDataScource);
  });

  group('uses data repository', () {
    test(
      "add to cart method",
      () async {
        when(() => mockDataScource.addToCart(cartItem))
            .thenAnswer((_) async {});
        await sut.addToCart(cartItem);
        verify(() => mockDataScource.addToCart(cartItem)).called(1);
      },
    );

    test(
      "remove from cart method",
      () async {
        when(() => mockDataScource.removeFromCart(cartItem))
            .thenAnswer((_) async {});
        await sut.removeFromCart(cartItem);
        verify(() => mockDataScource.removeFromCart(cartItem)).called(1);
      },
    );

    test(
      "clear cart method",
      () async {
        when(() => mockDataScource.clearCart()).thenAnswer((_) async {});
        await sut.clearCart();
        verify(() => mockDataScource.clearCart()).called(1);
      },
    );

    test(
      "increase quantity method",
      () async {
        when(() => mockDataScource.increaseQuantity(cartItem))
            .thenAnswer((_) async {});
        await sut.increaseQuantity(cartItem);
        verify(() => mockDataScource.increaseQuantity(cartItem)).called(1);
      },
    );

    test(
      "decrease quantity method",
      () async {
        when(() => mockDataScource.decreaseQuantity(cartItem))
            .thenAnswer((_) async {});
        sut.decreaseQuantity(cartItem);
        verify(() => mockDataScource.decreaseQuantity(cartItem)).called(1);
      },
    );

    test(
      "get cart method",
      () async {
        when(() => mockDataScource.getCart())
            .thenAnswer((_) => Stream.fromIterable([
                  [cartItem]
                ]));
        sut.getCart();

        verify(() => mockDataScource.getCart()).called(1);
      },
    );
  });

  group("get cart method", () {
    test(
      "returns stream when successful",
      () async {
        when(() => mockDataScource.getCart()).thenAnswer((_) => cartStream);
        final result = sut.getCart();
        expect(result, Right(cartStream));
      },
    );

    test(
      "returns failure when error",
      () async {
        when(() => mockDataScource.getCart())
            .thenThrow((_) => ServerException());
        final result = sut.getCart();
        expect(result, const Left(ServerFailure()));
      },
    );
  });
}

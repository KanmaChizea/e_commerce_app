import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/cart/domain/entity/cart_entity.dart';

import '../../../core/error/failures.dart';

abstract class ICartRepository {
  Either<Failure, Stream<List<CartEntity>>> getCart();
  Future<void> addToCart(CartEntity item);
  Future<void> clearCart();
  Future<void> removeFromCart(CartEntity item);
  Future<void> increaseQuantity(CartEntity item);
  Future<void> decreaseQuantity(CartEntity item);
}

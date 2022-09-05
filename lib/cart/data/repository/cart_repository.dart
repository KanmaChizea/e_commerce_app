import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/cart/data/source/remote_cart_datasource.dart';
import 'package:e_commerce_app/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_app/cart/domain/repository/cart_repository_interface.dart';
import 'package:e_commerce_app/core/error/failures.dart';

class CartRepository implements ICartRepository {
  CartRepository(
    IRemoteCartDataSource remoteCartDataSource,
  ) : _remotecartDataSource = remoteCartDataSource;
  final IRemoteCartDataSource _remotecartDataSource;

  @override
  Future<void> addToCart(CartEntity item) async {
    await _remotecartDataSource.addToCart(item);
  }

  @override
  Future<void> clearCart() async {
    await _remotecartDataSource.clearCart();
  }

  @override
  Future<void> decreaseQuantity(CartEntity item) async {
    await _remotecartDataSource.decreaseQuantity(item);
  }

  @override
  Either<Failure, Stream<List<CartEntity>>> getCart() {
    try {
      var cartList = _remotecartDataSource.getCart();
      return Right(cartList);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<void> increaseQuantity(CartEntity item) async {
    await _remotecartDataSource.increaseQuantity(item);
  }

  @override
  Future<void> removeFromCart(CartEntity item) async {
    await _remotecartDataSource.removeFromCart(item);
  }
}

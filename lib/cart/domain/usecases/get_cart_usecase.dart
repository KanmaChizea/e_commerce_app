import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';

import '../entity/cart_entity.dart';
import '../repository/cart_repository_interface.dart';

class GetCartUsecase {
  GetCartUsecase(ICartRepository cartRepository)
      : _cartRepository = cartRepository;

  final ICartRepository _cartRepository;

  Either<Failure, Stream<List<CartEntity>>> call() {
    return _cartRepository.getCart();
  }
}

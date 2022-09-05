import '../entity/cart_entity.dart';
import '../repository/cart_repository_interface.dart';

class IncreaseQuantityUsecase {
  IncreaseQuantityUsecase(ICartRepository cartRepository)
      : _cartRepository = cartRepository;

  final ICartRepository _cartRepository;

  Future<void> call(CartEntity item) async {
    await _cartRepository.increaseQuantity(item);
  }
}

import '../repository/cart_repository_interface.dart';

class ClearCartUsecase {
  ClearCartUsecase(ICartRepository cartRepository)
      : _cartRepository = cartRepository;

  final ICartRepository _cartRepository;

  Future<void> call() async {
    await _cartRepository.clearCart();
  }
}

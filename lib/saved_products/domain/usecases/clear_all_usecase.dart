import '../repository/saved_product_repository_interface.dart';

class ClearAllProductsUsecase {
  ClearAllProductsUsecase(ISavedProductRepository savedProductRepository)
      : _savedProductRepository = savedProductRepository;

  final ISavedProductRepository _savedProductRepository;

  Future<void> call() async {
    return await _savedProductRepository.clearAll();
  }
}

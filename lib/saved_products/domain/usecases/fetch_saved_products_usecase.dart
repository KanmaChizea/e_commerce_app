import '../repository/saved_product_repository_interface.dart';

class FetchSavedProductsUsecase {
  FetchSavedProductsUsecase(ISavedProductRepository savedProductRepository)
      : _savedProductRepository = savedProductRepository;

  final ISavedProductRepository _savedProductRepository;

  Stream<List> call() {
    return _savedProductRepository.savedProducts();
  }
}

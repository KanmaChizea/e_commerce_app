import '../repository/saved_product_repository_interface.dart';

class DeleteSavedProductsUsecase {
  DeleteSavedProductsUsecase(ISavedProductRepository savedProductRepository)
      : _savedProductRepository = savedProductRepository;

  final ISavedProductRepository _savedProductRepository;

  Future<void> call(int id) async {
    return await _savedProductRepository.deleteFromSaved(id);
  }
}

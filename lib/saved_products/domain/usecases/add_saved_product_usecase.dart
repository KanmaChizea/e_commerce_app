import '../repository/saved_product_repository_interface.dart';

class AddSavedProductsUsecase {
  AddSavedProductsUsecase(ISavedProductRepository savedProductRepository)
      : _savedProductRepository = savedProductRepository;

  final ISavedProductRepository _savedProductRepository;

  Future<void> call(int id) async {
    return await _savedProductRepository.addToSaved(id);
  }
}

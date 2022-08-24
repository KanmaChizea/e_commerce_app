import '../../../core/error/exceptions.dart';
import '../source/saved_products_source.dart';

import '../../domain/repository/saved_product_repository_interface.dart';

class SavedProductRepository implements ISavedProductRepository {
  SavedProductRepository(ISavedProductDataSource savedProductDataSource)
      : _savedProductDataSource = savedProductDataSource;

  final ISavedProductDataSource _savedProductDataSource;

  @override
  Future<void> addToSaved(int id) async {
    try {
      return await _savedProductDataSource.addToSaved(id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      return await _savedProductDataSource.clearAll();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteFromSaved(int id) async {
    try {
      return await _savedProductDataSource.deleteFromSaved(id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Stream<List> savedProducts() {
    return _savedProductDataSource.savedProducts();
  }
}

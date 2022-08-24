abstract class ISavedProductRepository {
  Future<void> addToSaved(int id);
  Future<void> deleteFromSaved(int id);
  Future<void> clearAll();
  Stream<List> savedProducts();
}

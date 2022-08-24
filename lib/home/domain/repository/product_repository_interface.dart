import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../entities/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<Product>>> fetchAllProducts();
  Future<Either<Failure, List<Product>>> fetchProductsInCategory(
      String category);
}

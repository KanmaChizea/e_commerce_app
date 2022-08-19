import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<Product>>> fetchAllProducts();
  Future<Either<Failure, List<Product>>> fetchProductsInCategory(
      String category);
}

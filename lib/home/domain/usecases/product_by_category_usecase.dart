import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository_interface.dart';

class ProductByCategoryUsecase {
  const ProductByCategoryUsecase(
      {required IProductRepository productRepository})
      : _productRepo = productRepository;
  final IProductRepository _productRepo;

  Future<Either<Failure, List<Product>>> call(String category) async {
    return await _productRepo.fetchProductsInCategory(category);
  }
}

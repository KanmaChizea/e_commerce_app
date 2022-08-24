import 'package:e_commerce_app/home/data/source/cached_produce_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../source/product_source.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  const ProductRepository(
      {required IProductService productService,
      required ICachedProductService cachedProductService,
      required InternetConnectionChecker internetConnectionChecker})
      : _productService = productService,
        _cachedProductService = cachedProductService,
        _connectionChecker = internetConnectionChecker;
  final IProductService _productService;
  final ICachedProductService _cachedProductService;
  final InternetConnectionChecker _connectionChecker;

  Future<bool> get isConnected async => await _connectionChecker.hasConnection;
  @override
  Future<Either<Failure, List<Product>>> fetchAllProducts() async {
    List<Product> result;
    bool hasInternet = await isConnected;

    if (hasInternet) {
      try {
        result = await _productService.getAllProducts();
        _cachedProductService.cacheProducts(result);
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      try {
        result = await _cachedProductService.getAllProducts();
      } catch (e) {
        return const Left(CacheFailure());
      }
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, List<Product>>> fetchProductsInCategory(
      String category) async {
    List<Product> result;
    bool hasInternet = await isConnected;

    if (hasInternet) {
      try {
        result = await _productService.getProductsInCategory(category);
      } catch (e) {
        return const Left(UnknownFailure());
      }
    } else {
      try {
        result = await _cachedProductService.getProductByCategory(category);
      } catch (e) {
        return const Left(CacheFailure());
      }
    }
    return Right(result);
  }
}

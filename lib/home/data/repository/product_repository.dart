import 'dart:io';

import 'package:e_commerce_app/home/data/source/cached_produce_service.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../source/product_source.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repository/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  const ProductRepository(
      {required IProductService productService,
      required ICachedProductService cachedProductService})
      : _productService = productService,
        _cachedProductService = cachedProductService;
  final IProductService _productService;
  final ICachedProductService _cachedProductService;

  @override
  Future<Either<Failure, List<Product>>> fetchAllProducts() async {
    List<Product> result;
    try {
      result = await _productService.getAllProducts();
      _cachedProductService.cacheProducts(result);
    }
    //when no internet connection
    //fetch from cache
    on SocketException {
      try {
        result = await _cachedProductService.getAllProducts();
      } on CacheException {
        return const Left(CacheFailure());
      }
    } catch (e) {
      return const Left(UnknownFailure());
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, List<Product>>> fetchProductsInCategory(
      String category) async {
    List<Product> result;
    try {
      result = await _productService.getProductsInCategory(category);
    } on CacheException {
      try {
        result = await _cachedProductService.getProductByCategory(category);
      } on CacheException {
        return const Left(CacheFailure());
      }
    } catch (e) {
      return const Left(UnknownFailure());
    }
    return Right(result);
  }
}

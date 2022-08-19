import 'dart:convert';

import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/home/data/model/product_model.dart';
import 'package:e_commerce_app/home/data/source/product_source.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/home/domain/repository/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  const ProductRepository({required IProductService productService})
      : _productService = productService;
  final IProductService _productService;

  @override
  Future<Either<Failure, List<Product>>> fetchAllProducts() async {
    try {
      final result = await _productService.getAllProducts();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchProductsInCategory(
      String category) async {
    try {
      final result = await _productService.getProductsInCategory(category);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}

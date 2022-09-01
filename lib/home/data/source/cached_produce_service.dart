import 'dart:developer';

import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../core/error/exceptions.dart';

abstract class ICachedProductService {
  Future<void> cacheProducts(List<Product> products);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductByCategory(String category);
}

class CachedProductService implements ICachedProductService {
  CachedProductService(Box box) : _box = box;

  final Box _box;

  @override
  Future<void> cacheProducts(List<Product> product) async {
    await _box.clear();
    for (var i in product) {
      await _box.add(i.toMap());
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      return _box.toMap().values.map((e) => Product.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      throw CacheException();
    }
  }

  @override
  Future<List<Product>> getProductByCategory(String category) async {
    try {
      final result = await getAllProducts();
      return result.where((element) => element.category == category).toList();
    } catch (e) {
      throw CacheException();
    }
  }
}

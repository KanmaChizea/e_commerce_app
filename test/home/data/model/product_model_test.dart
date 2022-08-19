import 'dart:io';

import 'package:e_commerce_app/home/data/model/product_model.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProductModel sut;

  setUp(() {
    sut = const ProductModel(
        title: 'tTitle',
        description: 'tDescription',
        category: 'tCategory',
        price: 10,
        image: 'tImage',
        rating: 1.0);
  });

  final jsonResponse = File('test/files/product.json').readAsStringSync();

  test(
    "should be a subclass of product entity",
    () async {
      expect(sut, isA<Product>());
    },
  );

  test(
    "should convert json to product model",
    () async {
      final result = ProductModel.fromJson(jsonResponse);

      expect(result, sut);
    },
  );
}

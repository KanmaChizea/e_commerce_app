import 'dart:convert';

import '../../domain/entities/product_entity.dart';

class ProductModel extends Product {
  const ProductModel(
      {required String title,
      required String description,
      required String category,
      required num price,
      required String image,
      required num rating})
      : super(
            category: category,
            title: title,
            price: price,
            image: image,
            description: description,
            rating: rating);

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        category: map['category'] ?? '',
        price: map['price'] ?? '',
        image: map['image'] ?? '',
        rating: map['rating']['rate'] ?? '');
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}

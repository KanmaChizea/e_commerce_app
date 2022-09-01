import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final num price;
  final String image;
  final num rating;
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      category,
      price,
      image,
      rating,
    ];
  }

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    num? price,
    String? image,
    num? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'image': image,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
      rating: map['rating'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, category: $category, price: $price, image: $image, rating: $rating)';
  }
}

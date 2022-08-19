import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String title;
  final String description;
  final String category;
  final num price;
  final String image;
  final num rating;
  const Product({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props => [title, description];
}

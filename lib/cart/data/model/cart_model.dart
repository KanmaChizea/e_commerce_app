import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:e_commerce_app/cart/domain/entity/cart_entity.dart';

import '../../../home/domain/entities/product_entity.dart';

class Cart extends Equatable {
  final String? id;
  final Product product;
  final int quantity;
  const Cart({
    this.id,
    required this.product,
    required this.quantity,
  });

  @override
  List<Object> get props => [product, quantity];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory Cart.fromFirebase(DocumentSnapshot map) {
    return Cart(
      id: map.id,
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  CartEntity toEntity() =>
      CartEntity(product: product, quantity: quantity, id: id ?? '');

  @override
  String toString() => 'Cart(id: $id, product: $product, quantity: $quantity)';

  Cart copyWith({
    String? id,
    Product? product,
    int? quantity,
  }) {
    return Cart(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] ?? '',
      product: Product.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));
}

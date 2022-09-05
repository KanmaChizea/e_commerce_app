import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/product_entity.dart';

class CartEntity extends Equatable {
  final String id;
  final Product product;
  final int quantity;

  const CartEntity({
    required this.id,
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [product];

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  CartEntity copyWith({
    String? id,
    Product? product,
    int? quantity,
  }) {
    return CartEntity(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadAllProducts extends ProductEvent {}

class LoadProductCategory extends ProductEvent {
  final String category;
  const LoadProductCategory({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}

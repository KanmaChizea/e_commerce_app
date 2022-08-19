part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailed extends ProductState {
  final Failure failure;
  const ProductFailed({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

class ProductLoaded extends ProductState {
  final List<Product> productList;
  const ProductLoaded({
    required this.productList,
  });

  @override
  List<Object> get props => [productList];
}

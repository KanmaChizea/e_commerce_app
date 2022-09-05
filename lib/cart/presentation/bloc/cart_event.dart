part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCart extends CartEvent {}

class EmitCartList extends CartEvent {
  final List<CartEntity> cartList;

  const EmitCartList(this.cartList);

  @override
  List<Object> get props => [cartList];
}

class AddToCart extends CartEvent {
  final CartEntity item;

  const AddToCart(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveFromCart extends CartEvent {
  final CartEntity item;

  const RemoveFromCart(this.item);

  @override
  List<Object> get props => [item];
}

class ClearCart extends CartEvent {}

class IncreaseQuantity extends CartEvent {
  final CartEntity item;

  const IncreaseQuantity(this.item);
  @override
  List<Object> get props => [item];
}

class DecreaseQuantity extends CartEvent {
  final CartEntity item;

  const DecreaseQuantity(this.item);
  @override
  List<Object> get props => [item];
}

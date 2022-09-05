import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_app/cart/domain/usecases/add_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/clear_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/decrease_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/increase_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/remove_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, List<CartEntity>> {
  CartBloc(
      {required GetCartUsecase getCartUsecase,
      required AddToCartUsecase addToCartUsecase,
      required RemoveFromCartUsecase removeFromCartUsecase,
      required ClearCartUsecase clearCartUsecase,
      required IncreaseQuantityUsecase increaseQuantityUsecase,
      required DecreaseQuantityUsecase decreaseQuantityUsecase})
      : _addToCartUsecase = addToCartUsecase,
        _clearCartUsecase = clearCartUsecase,
        _decreaseQuantityUsecase = decreaseQuantityUsecase,
        _increaseQuantityUsecase = increaseQuantityUsecase,
        _getCartUsecase = getCartUsecase,
        _removeFromCartUsecase = removeFromCartUsecase,
        super([]) {
    on<GetCart>(_onGetCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    on<EmitCartList>(_onEmitCartList);
    on<DecreaseQuantity>(_onDecreaseQuantity);
    on<IncreaseQuantity>(_onIncreaseQuantity);
  }

  final GetCartUsecase _getCartUsecase;
  final AddToCartUsecase _addToCartUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;
  final ClearCartUsecase _clearCartUsecase;
  final IncreaseQuantityUsecase _increaseQuantityUsecase;
  final DecreaseQuantityUsecase _decreaseQuantityUsecase;

  _onGetCart(GetCart event, Emitter emit) {
    final result = _getCartUsecase.call();
    result.fold(
        (l) => null,
        (r) => r.listen((event) {
              add(EmitCartList(event));
            }));
  }

  _onEmitCartList(EmitCartList event, Emitter emit) {
    emit(event.cartList);
  }

  _onAddToCart(AddToCart event, Emitter emit) async {
    await _addToCartUsecase.call(event.item);
  }

  _onRemoveFromCart(RemoveFromCart event, Emitter emit) async {
    await _removeFromCartUsecase.call(event.item);
  }

  _onClearCart(ClearCart event, Emitter emit) async {
    await _clearCartUsecase.call();
  }

  _onIncreaseQuantity(IncreaseQuantity event, Emitter emit) async {
    await _increaseQuantityUsecase.call(event.item);
  }

  _onDecreaseQuantity(DecreaseQuantity event, Emitter emit) async {
    await _decreaseQuantityUsecase.call(event.item);
  }
}

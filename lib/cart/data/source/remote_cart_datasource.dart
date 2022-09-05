import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/cart_entity.dart';
import '../model/cart_model.dart';

abstract class IRemoteCartDataSource {
  Stream<List<CartEntity>> getCart();
  Future<void> addToCart(CartEntity item);
  Future<void> clearCart();
  Future<void> removeFromCart(CartEntity item);
  Future<void> increaseQuantity(CartEntity item);
  Future<void> decreaseQuantity(CartEntity item);
}

class RemoteCartDataSource implements IRemoteCartDataSource {
  RemoteCartDataSource(CollectionReference ref) : _ref = ref;
  final CollectionReference _ref;
  @override
  Future<void> addToCart(CartEntity item) async {
    await _ref.add(item.toMap());
  }

  @override
  Future<void> clearCart() async {
    var snapshot = await _ref.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> decreaseQuantity(CartEntity item) async {
    final updated = item.copyWith(quantity: item.quantity - 1);
    await _ref.doc(item.id).update(updated.toMap());
  }

  @override
  Stream<List<CartEntity>> getCart() {
    return _ref.snapshots().map((collection) => collection.docs.map((e) {
          Cart cart = Cart.fromFirebase(e);
          return cart.toEntity();
        }).toList());
  }

  @override
  Future<void> increaseQuantity(CartEntity item) async {
    final updated = item.copyWith(quantity: item.quantity + 1);
    await _ref.doc(item.id).update(updated.toMap());
  }

  @override
  Future<void> removeFromCart(CartEntity item) async {
    await _ref.doc(item.id).delete();
  }
}

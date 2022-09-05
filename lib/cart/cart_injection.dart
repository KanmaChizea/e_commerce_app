import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/cart/data/repository/cart_repository.dart';
import 'package:e_commerce_app/cart/data/source/remote_cart_datasource.dart';
import 'package:e_commerce_app/cart/domain/repository/cart_repository_interface.dart';
import 'package:e_commerce_app/cart/domain/usecases/add_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/clear_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/decrease_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/get_cart_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/increase_usecase.dart';
import 'package:e_commerce_app/cart/domain/usecases/remove_usecase.dart';
import 'package:e_commerce_app/cart/presentation/bloc/cart_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final _sl = GetIt.instance;

void init() {
  _sl.registerFactory(() => CartBloc(
      getCartUsecase: _sl(),
      addToCartUsecase: _sl(),
      removeFromCartUsecase: _sl(),
      clearCartUsecase: _sl(),
      increaseQuantityUsecase: _sl(),
      decreaseQuantityUsecase: _sl()));

  _sl.registerLazySingleton(() => GetCartUsecase(_sl()));
  _sl.registerLazySingleton(() => AddToCartUsecase(_sl()));
  _sl.registerLazySingleton(() => RemoveFromCartUsecase(_sl()));
  _sl.registerLazySingleton(() => ClearCartUsecase(_sl()));
  _sl.registerLazySingleton(() => IncreaseQuantityUsecase(_sl()));
  _sl.registerLazySingleton(() => DecreaseQuantityUsecase(_sl()));

  _sl.registerLazySingleton<ICartRepository>(() => CartRepository(_sl()));

  _sl.registerLazySingleton<IRemoteCartDataSource>(
      () => RemoteCartDataSource(_sl()));

  _sl.registerLazySingleton<CollectionReference>(() {
    var id = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance.collection('cart $id');
  });
}

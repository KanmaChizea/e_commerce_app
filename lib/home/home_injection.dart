import 'package:e_commerce_app/home/data/source/cached_produce_service.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'data/repository/product_repository.dart';
import 'data/source/product_source.dart';
import 'domain/repository/product_repository_interface.dart';
import 'domain/usecases/all_product_usecase.dart';
import 'domain/usecases/product_by_category_usecase.dart';
import 'presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final _sl = GetIt.instance;
void init() {
  _sl.registerFactory(() => ProductBloc(_sl(), _sl()));

  //use cases
  _sl.registerLazySingleton(() => AllProductUsecase(productRepository: _sl()));
  _sl.registerLazySingleton(
      () => ProductByCategoryUsecase(productRepository: _sl()));

  //repo
  _sl.registerLazySingleton<IProductRepository>(() => ProductRepository(
      productService: _sl(),
      cachedProductService: _sl(),
      internetConnectionChecker: _sl()));

  //data source
  _sl.registerLazySingleton<IProductService>(() => ProductService());
  _sl.registerLazySingleton<ICachedProductService>(
      () => CachedProductService(_sl()));

  //external
  _sl.registerLazySingleton<Box>(() => Hive.box('data'));
  _sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}

import 'data/repository/saved_product_repository.dart';
import 'domain/repository/saved_product_repository_interface.dart';
import 'domain/usecases/add_saved_product_usecase.dart';
import 'domain/usecases/clear_all_usecase.dart';
import 'domain/usecases/delete_saved_product_usecase.dart';
import 'domain/usecases/fetch_saved_products_usecase.dart';
import 'presentation/cubit/saved_product_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/source/saved_products_source.dart';

final _sl = GetIt.instance;

void init() {
  _sl.registerFactory(() => SavedProductCubit(
      addSavedProductsUsecase: _sl(),
      deleteSavedProductsUsecase: _sl(),
      clearAllProductsUsecase: _sl(),
      fetchSavedProductsUsecase: _sl()));

  _sl.registerLazySingleton(() => AddSavedProductsUsecase(_sl()));
  _sl.registerLazySingleton(() => DeleteSavedProductsUsecase(_sl()));
  _sl.registerLazySingleton(() => ClearAllProductsUsecase(_sl()));
  _sl.registerLazySingleton(() => FetchSavedProductsUsecase(_sl()));

  _sl.registerLazySingleton<ISavedProductRepository>(
      () => SavedProductRepository(_sl()));
  _sl.registerLazySingleton<ISavedProductDataSource>(
      () => SavedProductDataSource());
}

import 'package:e_commerce_app/home/data/repository/product_repository.dart';
import 'package:e_commerce_app/home/data/source/product_source.dart';
import 'package:e_commerce_app/home/domain/repository/product_repository_interface.dart';
import 'package:e_commerce_app/home/domain/usecases/all_product_usecase.dart';
import 'package:e_commerce_app/home/domain/usecases/product_by_category_usecase.dart';
import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final _sl = GetIt.instance;
void init() {
  _sl.registerFactory(() => ProductBloc(_sl(), _sl()));

  //use cases
  _sl.registerLazySingleton(() => AllProductUsecase(productRepository: _sl()));
  _sl.registerLazySingleton(
      () => ProductByCategoryUsecase(productRepository: _sl()));

  //repo
  _sl.registerLazySingleton<IProductRepository>(
      () => ProductRepository(productService: _sl()));

  //data source
  _sl.registerLazySingleton<IProductService>(() => ProductService());
}

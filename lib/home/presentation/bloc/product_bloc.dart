import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/home/domain/usecases/all_product_usecase.dart';
import 'package:e_commerce_app/home/domain/usecases/product_by_category_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/product_entity.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(AllProductUsecase allProductUsecase,
      ProductByCategoryUsecase productByCategoryUsecase)
      : _allProductUsecase = allProductUsecase,
        _productByCategoryUsecase = productByCategoryUsecase,
        super(ProductInitial()) {
    on<LoadAllProducts>(_onLoadAllProducts);
    on<LoadProductCategory>(_onLoadProductCategory);
  }

  final AllProductUsecase _allProductUsecase;
  final ProductByCategoryUsecase _productByCategoryUsecase;

  Future<void> _onLoadAllProducts(
      LoadAllProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final result = await _allProductUsecase.call();
    emit(result.fold((l) => ProductFailed(failure: l),
        (r) => ProductLoaded(productList: r)));
  }

  Future<void> _onLoadProductCategory(
      LoadProductCategory event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final result = await _productByCategoryUsecase.call(event.category);
    emit(result.fold((l) => ProductFailed(failure: l),
        (r) => ProductLoaded(productList: r)));
  }
}

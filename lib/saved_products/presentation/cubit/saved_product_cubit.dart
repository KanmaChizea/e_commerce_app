import 'dart:async';

import '../../domain/usecases/add_saved_product_usecase.dart';
import '../../domain/usecases/clear_all_usecase.dart';
import '../../domain/usecases/delete_saved_product_usecase.dart';
import '../../domain/usecases/fetch_saved_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedProductCubit extends Cubit<List> {
  SavedProductCubit(
      {required AddSavedProductsUsecase addSavedProductsUsecase,
      required DeleteSavedProductsUsecase deleteSavedProductsUsecase,
      required ClearAllProductsUsecase clearAllProductsUsecase,
      required FetchSavedProductsUsecase fetchSavedProductsUsecase})
      : _addSavedProductsUsecase = addSavedProductsUsecase,
        _deleteSavedProductsUsecase = deleteSavedProductsUsecase,
        _clearAllProductsUsecase = clearAllProductsUsecase,
        _fetchSavedProductsUsecase = fetchSavedProductsUsecase,
        super(const []);

  final AddSavedProductsUsecase _addSavedProductsUsecase;
  final DeleteSavedProductsUsecase _deleteSavedProductsUsecase;
  final ClearAllProductsUsecase _clearAllProductsUsecase;
  final FetchSavedProductsUsecase _fetchSavedProductsUsecase;
  late StreamSubscription<List> _streamSubscription;

  fetchSavedProducts() {
    _streamSubscription = _fetchSavedProductsUsecase.call().listen((event) {
      emit(event);
    });
  }

  addSavedProduct(int id) async {
    return await _addSavedProductsUsecase.call(id);
  }

  deleteSavedProduct(int id) async {
    return await _deleteSavedProductsUsecase.call(id);
  }

  clearAllSavedProduct() async {
    return await _clearAllProductsUsecase.call();
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}

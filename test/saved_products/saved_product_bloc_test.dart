import 'package:e_commerce_app/saved_products/domain/usecases/add_saved_product_usecase.dart';
import 'package:e_commerce_app/saved_products/domain/usecases/clear_all_usecase.dart';
import 'package:e_commerce_app/saved_products/domain/usecases/delete_saved_product_usecase.dart';
import 'package:e_commerce_app/saved_products/domain/usecases/fetch_saved_products_usecase.dart';
import 'package:e_commerce_app/saved_products/presentation/cubit/saved_product_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'saved_product_constants.dart';

class MockAddSavedProductUsecase extends Mock
    implements AddSavedProductsUsecase {}

class MockDeleteSavedProductsUsecase extends Mock
    implements DeleteSavedProductsUsecase {}

class MockClearAllProductsUsecase extends Mock
    implements ClearAllProductsUsecase {}

class MockFetchSavedProductsUsecase extends Mock
    implements FetchSavedProductsUsecase {}

void main() {
  late SavedProductCubit sut;
  late MockAddSavedProductUsecase mockAdd;
  late MockClearAllProductsUsecase mockClear;
  late MockDeleteSavedProductsUsecase mockDelete;
  late MockFetchSavedProductsUsecase mockFetch;

  setUp(() {
    mockAdd = MockAddSavedProductUsecase();
    mockFetch = MockFetchSavedProductsUsecase();
    mockClear = MockClearAllProductsUsecase();
    mockDelete = MockDeleteSavedProductsUsecase();
    sut = SavedProductCubit(
        addSavedProductsUsecase: mockAdd,
        fetchSavedProductsUsecase: mockFetch,
        deleteSavedProductsUsecase: mockDelete,
        clearAllProductsUsecase: mockClear);
  });

  test(
    "add saved product uses the use case",
    () async {
      when(() => mockAdd.call(any())).thenAnswer((_) async {});
      await sut.addSavedProduct(1);
      verify(() => mockAdd.call(1)).called(1);
    },
  );

  test(
    "delete saved product uses the use case",
    () async {
      when(() => mockDelete.call(any())).thenAnswer((_) async {});
      await sut.deleteSavedProduct(1);
      verify(() => mockDelete.call(1)).called(1);
    },
  );

  test(
    "clear all saved product uses the use case",
    () async {
      when(() => mockClear.call()).thenAnswer((_) async {});
      await sut.clearAllSavedProduct();
      verify(() => mockClear.call()).called(1);
    },
  );

  group("fetch product method", () {
    test(
      "uses the usecase",
      () async {
        when(() => mockFetch.call()).thenAnswer((_) => streamList);
        await sut.fetchSavedProducts();
        verify(() => mockFetch.call()).called(1);
      },
    );

    test(
      "returns stream of lists",
      () async {
        when(() => mockFetch.call()).thenAnswer((_) => streamList);
        await sut.fetchSavedProducts();
        expect(sut.state, list);
      },
    );
  });
}

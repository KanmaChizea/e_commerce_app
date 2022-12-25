import 'package:e_commerce_app/saved_products/data/repository/saved_product_repository.dart';
import 'package:e_commerce_app/saved_products/data/source/saved_products_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'saved_product_constants.dart';

class MockSavedProductDataSource extends Mock
    implements SavedProductDataSource {}

void main() {
  late SavedProductRepository sut;
  late MockSavedProductDataSource mockSavedProductDataSource;

  setUp(() {
    mockSavedProductDataSource = MockSavedProductDataSource();
    sut = SavedProductRepository(mockSavedProductDataSource);
  });

  test(
    "add to saved method uses data source",
    () async {
      when(() => mockSavedProductDataSource.addToSaved(any()))
          .thenAnswer((_) async {});
      await sut.addToSaved(2);
      verify(() => mockSavedProductDataSource.addToSaved(2)).called(1);
    },
  );

  test(
    "delete from saved method uses data source",
    () async {
      when(() => mockSavedProductDataSource.deleteFromSaved(any()))
          .thenAnswer((_) async {});
      await sut.deleteFromSaved(2);
      verify(() => mockSavedProductDataSource.deleteFromSaved(2)).called(1);
    },
  );

  test(
    "clear all saved method uses data source",
    () async {
      when(() => mockSavedProductDataSource.clearAll())
          .thenAnswer((_) async {});
      await sut.clearAll();
      verify(() => mockSavedProductDataSource.clearAll()).called(1);
    },
  );

  group('saved product method', () {
    test(
      "uses data source",
      () async {
        when(() => mockSavedProductDataSource.savedProducts())
            .thenAnswer((_) => streamList);
        sut.savedProducts();
        verify(() => mockSavedProductDataSource.savedProducts()).called(1);
      },
    );

    test(
      "returns a stream of lists",
      () async {
        when(() => mockSavedProductDataSource.savedProducts())
            .thenAnswer((_) => streamList);
        final result = sut.savedProducts();
        expect(result, streamList);
      },
    );
  });
}

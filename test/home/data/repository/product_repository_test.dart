import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/home/data/model/product_model.dart';
import 'package:e_commerce_app/home/data/repository/product_repository.dart';
import 'package:e_commerce_app/home/data/source/product_source.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductService extends Mock implements IProductService {}

void main() {
  late ProductRepository sut;
  late MockProductService mockProductService;

  setUp(() {
    mockProductService = MockProductService();
    sut = ProductRepository(productService: mockProductService);
  });

  const tProductModel = ProductModel(
      title: 'tTitle',
      description: 'tDescription',
      category: 'tCategory',
      price: 10,
      image: 'tImage',
      rating: 1.0);
  const Product tProduct = tProductModel;

  group('get all products', () {
    test(
      "should call product service once",
      () async {
        when(() => mockProductService.getAllProducts())
            .thenAnswer((_) async => [tProductModel]);
        sut.fetchAllProducts();
        verify(() => mockProductService.getAllProducts()).called(1);
      },
    );

    test(
      "should return a list of products",
      () async {
        when(() => mockProductService.getAllProducts())
            .thenThrow(ServerException());
        final result = await sut.fetchAllProducts();
        expect(result, Left(ServerFailure()));
      },
    );
  });

  // test(
  //   "should return a list of products",
  //   () async {
  //     when(() => mockProductService.getAllProducts())
  //         .thenAnswer((_) async => [tProductModel]);
  //     final result = await sut.fetchAllProducts();
  //     print(result);
  //     expect(result, Right([tProductModel]));
  //   },
  // );

  group("get products in category", () {
    test(
      "should call product service once",
      () async {
        when(() => mockProductService.getProductsInCategory(any()))
            .thenAnswer((_) async => [tProductModel]);
        sut.fetchProductsInCategory('');
        verify(() => mockProductService.getProductsInCategory('')).called(1);
      },
    );

    test(
      "should fetch the products in a given category and returns a list of products",
      () async {
        when(() => mockProductService.getProductsInCategory(any()))
            .thenAnswer((_) async => [tProductModel]);
        final result = await sut.fetchProductsInCategory('');
        expect(result, const Right([tProduct]));
      },
    );
  });
}

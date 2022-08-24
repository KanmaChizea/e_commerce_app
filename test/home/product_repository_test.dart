import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/home/data/repository/product_repository.dart';
import 'package:e_commerce_app/home/data/source/cached_produce_service.dart';
import 'package:e_commerce_app/home/data/source/product_source.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockProductService extends Mock implements IProductService {}

class MockCachedProductService extends Mock implements ICachedProductService {}

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late ProductRepository sut;
  late MockProductService mockProductService;
  late MockCachedProductService mockCachedProductService;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockCachedProductService = MockCachedProductService();
    mockProductService = MockProductService();
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    sut = ProductRepository(
        cachedProductService: mockCachedProductService,
        productService: mockProductService,
        internetConnectionChecker: mockInternetConnectionChecker);
  });

  List<Product> productList = List.generate(
      3,
      (index) => Product(
          id: index,
          title: 'title$index',
          description: 'description$index',
          category: 'category$index',
          price: index,
          image: 'image$index',
          rating: index));

  void arrangeInternetCheckReturnsTrue() {
    when(() => mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => true);
  }

  void arrangeInternetCheckReturnsFalse() {
    when(() => mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => false);
  }

  group('fetch all products method', () {
    test(
      "uses product service class when there's interner connection",
      () async {
        arrangeInternetCheckReturnsTrue();
        await sut.fetchAllProducts();
        verify(() => mockProductService.getAllProducts()).called(1);
      },
    );

    test(
      "uses cached product service class when there's no internet connection",
      () async {
        arrangeInternetCheckReturnsFalse();
        await sut.fetchAllProducts();
        verify(() => mockCachedProductService.getAllProducts()).called(1);
      },
    );

    test(
      "returns list of products from remote source when there's internet connection",
      () async {
        arrangeInternetCheckReturnsTrue();
        when(() => mockProductService.getAllProducts())
            .thenAnswer((_) async => productList);
        when(() => mockCachedProductService.cacheProducts(productList))
            .thenAnswer((_) async {});
        final result = await sut.fetchAllProducts();
        expect(result, Right(productList));
      },
    );

    test(
      "returns list of products from local source when there is no internet connection",
      () async {
        arrangeInternetCheckReturnsFalse();
        when(() => mockCachedProductService.getAllProducts())
            .thenAnswer((_) async => productList);
        final result = await sut.fetchAllProducts();
        expect(result, Right(productList));
      },
    );
  });

  group('fetch products in category method', () {
    test(
      "uses product service class when there's interner connection",
      () async {
        arrangeInternetCheckReturnsTrue();
        await sut.fetchProductsInCategory('category');
        verify(() => mockProductService.getProductsInCategory('category'))
            .called(1);
      },
    );

    test(
      "uses cached product service class when there's no internet connection",
      () async {
        arrangeInternetCheckReturnsFalse();
        await sut.fetchProductsInCategory('category');
        verify(() => mockCachedProductService.getProductByCategory('category'))
            .called(1);
      },
    );

    test(
      "returns list of products from remote source when there's internet connection",
      () async {
        arrangeInternetCheckReturnsTrue();
        when(() => mockProductService.getProductsInCategory(any()))
            .thenAnswer((_) async => productList);
        when(() => mockCachedProductService.cacheProducts(productList))
            .thenAnswer((_) async {});
        final result = await sut.fetchProductsInCategory('category');
        expect(result, Right(productList));
      },
    );

    test(
      "returns list of products from local source when there is no internet connection",
      () async {
        arrangeInternetCheckReturnsFalse();
        when(() => mockCachedProductService.getProductByCategory('category'))
            .thenAnswer((_) async => productList);
        final result = await sut.fetchProductsInCategory('category');
        expect(result, Right(productList));
      },
    );
  });
}

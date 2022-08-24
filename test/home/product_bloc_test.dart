import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/home/domain/usecases/all_product_usecase.dart';
import 'package:e_commerce_app/home/domain/usecases/product_by_category_usecase.dart';
import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAllProductUseCase extends Mock implements AllProductUsecase {}

class MockProductByCategoryUseCase extends Mock
    implements ProductByCategoryUsecase {}

void main() {
  late ProductBloc sut;
  late MockAllProductUseCase mockAllProductUseCase;
  late MockProductByCategoryUseCase mockProductByCategoryUseCase;

  setUp(() {
    mockAllProductUseCase = MockAllProductUseCase();
    mockProductByCategoryUseCase = MockProductByCategoryUseCase();
    sut = ProductBloc(mockAllProductUseCase, mockProductByCategoryUseCase);
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
  group('load all product event', () {
    void arrangeAllProductsUseCaseReturnRight() {
      when(() => mockAllProductUseCase.call())
          .thenAnswer((_) async => Right(productList));
    }

    void arrangeAllProductsUseCaseReturnLeft() {
      when(() => mockAllProductUseCase.call())
          .thenAnswer((_) async => const Left(UnknownFailure()));
    }

    test(
      "uses all product use case",
      () async {
        arrangeAllProductsUseCaseReturnRight();
        sut.add(LoadAllProducts());
        await Future.delayed(const Duration(seconds: 5));
        verify(() => mockAllProductUseCase.call()).called(1);
      },
    );

    test(
      "emits failed state on failure to fetch product",
      () async {
        arrangeAllProductsUseCaseReturnLeft();
        expectLater(
            sut.stream,
            emitsInOrder([
              ProductLoading(),
              const ProductFailed(failure: UnknownFailure())
            ]));
        sut.add(LoadAllProducts());
      },
    );

    test(
      "emits product loaded on successful fetch",
      () async {
        arrangeAllProductsUseCaseReturnRight();
        expectLater(
            sut.stream,
            emitsInOrder(
                [ProductLoading(), ProductLoaded(productList: productList)]));
        sut.add(LoadAllProducts());
      },
    );
  });
}

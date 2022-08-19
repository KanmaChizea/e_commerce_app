import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/home/data/model/product_model.dart';
import 'package:e_commerce_app/home/domain/usecases/all_product_usecase.dart';
import 'package:e_commerce_app/home/domain/usecases/product_by_category_usecase.dart';
import 'package:e_commerce_app/home/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAllProductUseCase extends Mock implements AllProductUsecase {}

class MockProductByCategoryUsecase extends Mock
    implements ProductByCategoryUsecase {}

void main() {
  late ProductBloc sut;
  late MockAllProductUseCase mockAllProductUseCase;
  late MockProductByCategoryUsecase mockProductByCategoryUsecase;

  setUp(() {
    mockAllProductUseCase = MockAllProductUseCase();
    mockProductByCategoryUsecase = MockProductByCategoryUsecase();
    sut = ProductBloc(mockAllProductUseCase, mockProductByCategoryUsecase);
  });

  const tProducts = ProductModel(
      title: 'tTitle',
      description: 'tDescription',
      category: 'tCategory',
      price: 10,
      image: 'tImage',
      rating: 1.0);
  group('load all product events', () {
    test(
      "should emit product loading and product loaded when data is gotten ",
      () async {
        when(() => mockAllProductUseCase.call())
            .thenAnswer((_) async => const Right([tProducts]));
        sut.add(LoadAllProducts());
        expect(
            sut.stream,
            emitsInOrder([
              ProductLoading(),
              const ProductLoaded(productList: [tProducts])
            ]));
      },
    );

    test(
      "should emit product loading and product failed when data failed ",
      () async {
        when(() => mockAllProductUseCase.call())
            .thenAnswer((_) async => const Left(ServerFailure()));
        sut.add(LoadAllProducts());
        expect(
            sut.stream,
            emitsInOrder([
              ProductLoading(),
              const ProductFailed(failure: ServerFailure())
            ]));
      },
    );
  });

  group("load product category", () {
    test(
      "should emit product loading and product loaded when data is gotten ",
      () async {
        when(() => mockProductByCategoryUsecase.call('testCategory'))
            .thenAnswer((_) async => const Right([tProducts]));
        sut.add(const LoadProductCategory(category: 'testCategory'));
        expect(
            sut.stream,
            emitsInOrder([
              ProductLoading(),
              const ProductLoaded(productList: [tProducts])
            ]));
      },
    );

    test(
      "should emit product loading and product failed when data fetch fails",
      () async {
        when(() => mockProductByCategoryUsecase.call('testCategory'))
            .thenAnswer((_) async => const Left(ServerFailure()));
        sut.add(const LoadProductCategory(category: 'testCategory'));
        expect(
            sut.stream,
            emitsInOrder([
              ProductLoading(),
              const ProductFailed(failure: ServerFailure())
            ]));
      },
    );
  });
}

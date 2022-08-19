import 'dart:convert';

import 'package:e_commerce_app/core/error/exceptions.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

abstract class IProductService {
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsInCategory(String category);
}

class ProductService implements IProductService {
  List<Product> convertToProductList(String responseBody) {
    final decodedResponse =
        jsonDecode(responseBody).cast<Map<String, dynamic>>();
    final result = decodedResponse
        .map<ProductModel>((e) => ProductModel.fromMap(e))
        .toList();
    return result;
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      return convertToProductList(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Product>> getProductsInCategory(String category) async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$category'));
    if (response.statusCode == 200) {
      return convertToProductList(response.body);
    } else {
      throw ServerException();
    }
  }
}

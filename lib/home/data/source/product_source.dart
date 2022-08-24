import 'dart:convert';

import '../../domain/entities/product_entity.dart';
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
    return convertToProductList(response.body);
  }

  @override
  Future<List<Product>> getProductsInCategory(String category) async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$category'));

    return convertToProductList(response.body);
  }
}

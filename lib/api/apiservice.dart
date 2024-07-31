import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machinetest/model/products/product.dart';
import 'package:machinetest/model/products/products.dart';

class ApiService {
  final String _baseUrl =
      'https://mansharcart.com/api/products/category/139/key/123456789';

  Future<List<Product>?> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var mainResponse = Products.fromJson(jsonResponse);
        return mainResponse.products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

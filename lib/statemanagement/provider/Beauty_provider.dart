import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haupcartest/model/Beauty/beautyproductModel.dart';
import 'package:http/http.dart' as http;

class ProductBeautyprovider with ChangeNotifier {
  final apiUrl = 'https://dummyjson.com/products/category/beauty';
  List<Product> productBeautyList = [];

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productBeautyList =
              productsData.map((item) => Product.fromJson(item)).toList();
          notifyListeners();
        } else {
          throw Exception('Failed to load products: key "products" not found');
        }
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}

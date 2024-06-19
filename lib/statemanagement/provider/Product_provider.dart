import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haupcartest/model/beautyproductModel.dart';
import 'package:http/http.dart' as http;

class Productprovider with ChangeNotifier {
  final beautyUrl = 'https://dummyjson.com/products/category/beauty';
  final fragrancesUrl = 'https://dummyjson.com/products/category/fragrances';
  final furnitureUrl = 'https://dummyjson.com/products/category/furniture';
  final groceriesUrl = 'https://dummyjson.com/products/category/groceries';

  List<Product> productBeautyList = [];
  List<Product> productFragrancesList = [];

  List<Product> productFurnitureList = [];
  List<Product> productGroceriesList = [];

  Future<void> fetchProductsBeauty() async {
    try {
      final response = await http.get(Uri.parse(beautyUrl));

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

  Future<void> fetchProductsFragrances() async {
    try {
      final response = await http.get(Uri.parse(fragrancesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productFragrancesList =
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

  Future<void> fetchProductsFurniture() async {
    try {
      final response = await http.get(Uri.parse(furnitureUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productFurnitureList =
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

  Future<void> fetchProductsGroceries() async {
    try {
      final response = await http.get(Uri.parse(groceriesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productGroceriesList =
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

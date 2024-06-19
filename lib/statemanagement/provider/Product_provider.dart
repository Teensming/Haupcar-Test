import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haupcartest/model/beautyproductModel.dart';
import 'package:http/http.dart' as http;

class Productprovider with ChangeNotifier {
  final beautyUrl = 'https://dummyjson.com/products/category/beauty';
  final fragrancesUrl = 'https://dummyjson.com/products/category/fragrances';
  final furnitureUrl = 'https://dummyjson.com/products/category/furniture';
  final groceriesUrl = 'https://dummyjson.com/products/category/groceries';
  final homedecorationUrl =
      'https://dummyjson.com/products/category/home-decoration';
  final kitchenAccessoriesUrl =
      'https://dummyjson.com/products/category/kitchen-accessories';
  final laptopsUrl = 'https://dummyjson.com/products/category/laptops';
  final mensShirtsUrl = 'https://dummyjson.com/products/category/mens-shirts';

  final mensShoesUrl = 'https://dummyjson.com/products/category/mens-shoes';
  final mensWatchesUrl = 'https://dummyjson.com/products/category/mens-watches';
  final mobileAccessoriesUrl =
      'https://dummyjson.com/products/category/mobile-accessories';
  final motorcycleUrl = 'https://dummyjson.com/products/category/motorcycle';
  final skinCareUrl = 'https://dummyjson.com/products/category/skin-care';
  final smartphonesUrl = 'https://dummyjson.com/products/category/smartphones';
  final sportsAccessoriesUrl =
      'https://dummyjson.com/products/category/sports-accessories';
  final sunglassesUrl = 'https://dummyjson.com/products/category/sunglasses';
  final tabletsUrl = 'https://dummyjson.com/products/category/tablets';
  final topsUrl = 'https://dummyjson.com/products/category/tops';
  final vehicleUrl = 'https://dummyjson.com/products/category/vehicle';
  final womensBagsUrl = 'https://dummyjson.com/products/category/womens-bags';
  final womensDressesUrl =
      'https://dummyjson.com/products/category/womens-dresses';
  final womensJewelleryUrl =
      'https://dummyjson.com/products/category/womens-jewellery';
  final womensShoesUrl = 'https://dummyjson.com/products/category/womens-shoes';
  final womensWatchesUrl =
      'https://dummyjson.com/products/category/womens-watches';

  List<Product> productBeautyList = [];
  List<Product> productFragrancesList = [];
  List<Product> productFurnitureList = [];
  List<Product> productGroceriesList = [];
  List<Product> productHomedecorationList = [];
  List<Product> productKitchenAccessoriesList = [];
  List<Product> productLaptopsList = [];
  List<Product> productMensShirtsList = [];
  List<Product> productMensShoesList = [];
  List<Product> productMensWatchesList = [];
  List<Product> productMobileAccessoriesList = [];
  List<Product> productMotorcycleList = [];
  List<Product> productSkinCareList = [];
  List<Product> productSmartphonesList = [];
  List<Product> productSportsAccessoriesList = [];
  List<Product> productSunglassesList = [];
  List<Product> productTabletsList = [];
  List<Product> productTopsList = [];
  List<Product> productVehicleList = [];
  List<Product> productWomensBagsList = [];
  List<Product> productWomensDressesList = [];
  List<Product> productWomensJewelleryList = [];
  List<Product> productWomensShoesList = [];
  List<Product> productWomensWatchesList = [];

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

  Future<void> fetchProductsHomedecoration() async {
    try {
      final response = await http.get(Uri.parse(homedecorationUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productHomedecorationList =
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

  Future<void> fetchProductsKitchen() async {
    try {
      final response = await http.get(Uri.parse(kitchenAccessoriesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productKitchenAccessoriesList =
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

  Future<void> fetchProductsLaptop() async {
    try {
      final response = await http.get(Uri.parse(laptopsUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productLaptopsList =
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

  Future<void> fetchProductsMenshirt() async {
    try {
      final response = await http.get(Uri.parse(mensShirtsUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productMensShirtsList =
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

  Future<void> fetchProductsMenshoes() async {
    try {
      final response = await http.get(Uri.parse(mensShoesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productMensShoesList =
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

  Future<void> fetchProductsMensWatches() async {
    try {
      final response = await http.get(Uri.parse(mensWatchesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productMensWatchesList =
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

  Future<void> fetchProductsMobile() async {
    try {
      final response = await http.get(Uri.parse(mobileAccessoriesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productMobileAccessoriesList =
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

  Future<void> fetchProductsMotorcycle() async {
    try {
      final response = await http.get(Uri.parse(motorcycleUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productMotorcycleList =
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

  Future<void> fetchProductsSkincare() async {
    try {
      final response = await http.get(Uri.parse(skinCareUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productSkinCareList =
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

  Future<void> fetchProductsSmartphones() async {
    try {
      final response = await http.get(Uri.parse(smartphonesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productSmartphonesList =
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

  Future<void> fetchProductsSports() async {
    try {
      final response = await http.get(Uri.parse(sportsAccessoriesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productSportsAccessoriesList =
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

  Future<void> fetchProductsSunglasses() async {
    try {
      final response = await http.get(Uri.parse(sunglassesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productSunglassesList =
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

  Future<void> fetchProductsTablets() async {
    try {
      final response = await http.get(Uri.parse(tabletsUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productTabletsList =
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

  Future<void> fetchProductsTops() async {
    try {
      final response = await http.get(Uri.parse(topsUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productTopsList =
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

  Future<void> fetchProductsVehicle() async {
    try {
      final response = await http.get(Uri.parse(vehicleUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productVehicleList =
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

  Future<void> fetchProductsWomenBags() async {
    try {
      final response = await http.get(Uri.parse(womensBagsUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productWomensBagsList =
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

  Future<void> fetchProductsWomenDress() async {
    try {
      final response = await http.get(Uri.parse(womensDressesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productWomensDressesList =
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

  Future<void> fetchProductsWomenJewellery() async {
    try {
      final response = await http.get(Uri.parse(womensJewelleryUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productWomensJewelleryList =
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

  Future<void> fetchProductsWomenshoes() async {
    try {
      final response = await http.get(Uri.parse(womensShoesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productWomensShoesList =
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

  Future<void> fetchProductsWomenWatch() async {
    try {
      final response = await http.get(Uri.parse(womensWatchesUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('products')) {
          final List<dynamic> productsData = data['products'];
          productWomensWatchesList =
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

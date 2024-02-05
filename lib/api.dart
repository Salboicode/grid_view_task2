// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class DataSource {
  static List<ProductDataModel> listOfProduct = [];
  
  static Future<void> getProductsFromApi() async {
    try {
      print('getProductsFromApi loading');
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        Map<String, dynamic> apiData = jsonDecode(response.body);
        print(apiData);

        for (Map<String, dynamic> p in apiData['products']) {
          ProductDataModel product = ProductDataModel.fromMap(p);
          listOfProduct.add(product);
        }
      }
    } catch (error) {
      debugPrint('Error: $error');
    }
  }
}

class ProductDataModel {
  String productName;
  int productPrice;
  String productImage;
  num productRating;
  int productStock;

  ProductDataModel({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productRating,
    required this.productStock,
  });

  factory ProductDataModel.fromMap(Map<String, dynamic> json) {
    return ProductDataModel(
      productName: json['title'],
      productPrice: json['price'],
      productImage: json['thumbnail'],
      productRating: json['rating'],
      productStock: json['stock'],
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezzoo_assignment/modules/product_module.dart';

class ProductServer with ChangeNotifier {
  List<ProductsModule> _product = [];
  List<ProductsModule> product = [];
  List<ProductsModule> addProduct = [];


  List<ProductsModule> get productList => _product;

  Future<void> getProducts() async {
    if (_product.isEmpty) {
      final String response =
          await rootBundle.loadString('assets/jsons/product.json');
      final dynamic data = await json.decode(response);
      _product =
          data.map<ProductsModule>((e) => ProductsModule.fromJson(e)).toList();
      notifyListeners();
    }
  }

  void setCard(String action, ProductsModule product) {
    switch (action) {
      case 'add':
        {
          addProduct.add(product);
          break;
        }
      case 'delete':
        {
          addProduct.removeWhere((element) => element.id == product.id);
          break;
        }
    }
    notifyListeners();
  }


  List findProduct(String id) {
    return _product
        .where((element) => element.category_id.toString() == id.toString())
        .toList();
  }
}

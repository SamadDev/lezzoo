import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezzoo_assignment/modules/category_module.dart';

class CategoryServer with ChangeNotifier {
  List<CategoryModule> _category = [];
  List<CategoryModule> get categoryList => _category;


  Future<void> getCategory() async {
    if (_category.isEmpty) {
      final String response =
      await rootBundle.loadString('assets/jsons/category.json');
      List data = await json.decode(response)['category'];
      _category = data.map<CategoryModule>((e) => CategoryModule.fromJson(e)).toList();
      notifyListeners();
    }
  }
  //make category a group by title
  List findCategory(String id) {
    return _category.where((element) => element.id == id).toList();
  }
}
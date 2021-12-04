import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lezzoo_assignment/modules/store_module.dart';

class StoreServer with ChangeNotifier {
  List<StoresModule> _store = [];
  List<StoresModule> get storeList => _store;

  List<StoresModule> _specialStore = [];
  List<StoresModule> get specialStoreList => _specialStore;

  int currentIndex = 0;
   getCurrentIndex(index) {
    currentIndex = index;
    notifyListeners();
  }


  Future<void> getStores() async {
    if (_store.isEmpty) {
      final String response =
      await rootBundle.loadString('assets/jsons/store.json');
      List data = await json.decode(response)['store'];
      _store = data.map<StoresModule>((e) => StoresModule.fromJson(e)).toList();
      notifyListeners();
    }
  }

  Future<void> getSpecialStores() async {
    if (_specialStore.isEmpty) {
      final String response =
      await rootBundle.loadString('assets/jsons/special_store.json');
      List data = await json.decode(response)['special_store'];
      _specialStore = data.map<StoresModule>((e) => StoresModule.fromJson(e)).toList();
      notifyListeners();
    }
  }


}
import 'package:flutter/material.dart';
import 'package:ezzeldeen_0522029/Model/products_model.dart';
import 'package:ezzeldeen_0522029/Service/Items_Service.dart';

class ItemProvider with ChangeNotifier {
  List<ProduModel>? model;
  bool loading = false;
  String? error;

  List<ProduModel>? get produModel => model;
  bool get isLoading => loading;
  String? get err => error;

  Future<void> fetchData() async {
    if (model == null) {
      loading = true;
      notifyListeners();

      try {
        model = await ItemService.getdata();
      } catch (e) {
        error = e.toString();
      } finally {
        loading = false;
        notifyListeners();
      }
    }
  }
}

import 'package:ezzeldeen_0522029/Model/products_model.dart';
import 'package:ezzeldeen_0522029/Service/Items_Service.dart';
import 'package:flutter/material.dart';
class ProductProvider extends ChangeNotifier
{
  ProductModel? productModel;
  Future<void> getProductProvider() async
  {
    productModel = await ProductService.getProduct();
    notifyListeners();
  }
}
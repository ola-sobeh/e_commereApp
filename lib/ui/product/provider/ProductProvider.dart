import 'package:e_commere/ui/Home/model/AllProductsResponse.dart';
import 'package:e_commere/ui/product/data/ProductApiHelper.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{
  AllProductsResponse product;
  getProductResponse(int id) async {
    product = null;
    product = await ProductApiHelper.apiHelper.getProductDetails(id);
    notifyListeners();
  }
}
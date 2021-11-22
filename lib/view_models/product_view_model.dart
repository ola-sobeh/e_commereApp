import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:e_commere/services/api_services.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier{
  AllProductsResponse product;
  getProductResponse(int id) async {
    product = null;
    product = await ApiService.apiHelper.getProductDetails(id);
    notifyListeners();
  }
}
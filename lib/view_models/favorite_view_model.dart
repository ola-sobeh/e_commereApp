import 'package:e_commere/services/sqflite_service.dart';
import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:flutter/material.dart';

class FavoriteViewModel extends ChangeNotifier{

  List<AllProductsResponse> allFavoiratProducts;


  insertProductInFavourite(AllProductsResponse allProductsResponse) async {
    await DbHelper.dbHelper.addToFavourite(allProductsResponse);
    getAllProductsInFavourite();
    notifyListeners();
  }
  getAllProductsInFavourite() async {
    List<Map<String, Object>> products = await DbHelper.dbHelper.getFavourite();
    allFavoiratProducts = products.map((e) {
      return AllProductsResponse.fromJson(e);
    }).toList();
    notifyListeners();
  }

}
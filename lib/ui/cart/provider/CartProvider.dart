
import 'package:e_commere/ui/Home/model/AllProductsResponse.dart';
import 'package:e_commere/helper/SqfliteHelper.dart';
import 'package:e_commere/ui/Home/ui/widget/CustomDialoug.dart';
import 'package:flutter/material.dart';
class CartProvider extends ChangeNotifier {
  List<AllProductsResponse> allCartProducts;

  insertProductInCart(AllProductsResponse allProductsResponse) async {
    await DbHelper.dbHelper.addToCart(allProductsResponse);
    getAllProductsInCart();
  }

  getAllProductsInCart() async {
    List<Map<String, Object>> products = await DbHelper.dbHelper.getCart();
    allCartProducts = products.map((e) {
      return AllProductsResponse.fromJson(e);
    }).toList();
    notifyListeners();
  }

  deleteProductInCart(int id, context) async {
    CustomDialoug.customDialoug.showCustomDialoug(
        context,
        'You will delete this product from cart, are you sure',
        'Alert',
        executeDelete,
        id);
  }
  executeDelete(int id) async {
    await DbHelper.dbHelper.removeFromCart(id);
    getAllProductsInCart();
  }
}
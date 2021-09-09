import 'dart:convert';

import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:e_commere/ui/widgets/CustomDialoug.dart';
import 'package:e_commere/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';

import '../helper/apiHelper.dart';

class HomeProvider extends ChangeNotifier {
  List<AllProductsResponse> categoryProducts;
  List<AllProductsResponse> allProducts;
  List<AllProductsResponse> allFavoiratProducts;
  List<AllProductsResponse> allCartProducts;
  List<AllProductsResponse> allCategoryProducts;
  List<dynamic> allCategories;
  List<String> ImagesList;
  int currentPageIndex = 0;
  String selectedCategory;
  PageController pageController = PageController();
  AllProductsResponse product;

  getProductResponse(int id) async {
    product = null;
    product = await ApiHelper.apiHelper.getProductDetails(id);
    notifyListeners();
  }

  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }

  HomeProvider() {
    getAllProducts();
    getAllCategories();
    getProductForSlider();
  }

  getAllProducts() async {
    allProducts = await ApiHelper.apiHelper.getAllProducts();
    notifyListeners();
  }

  getAllCategories() async {
    allCategories = await ApiHelper.apiHelper.getAllCategory();
    notifyListeners();
  }

  getProductForSlider() async {
    ImagesList = await ApiHelper.apiHelper.getRandomProduct();
    notifyListeners();
  }

  selectCategory(String categoryName) {
    this.categoryProducts = null;
    this.selectedCategory = categoryName;
    getAllProductsInCategory();
    notifyListeners();
  }

  getAllProductsInCategory() async {
    categoryProducts =
        await ApiHelper.apiHelper.getAllProductsInCategory(selectedCategory);
    notifyListeners();
  }

  insertProductInFavourite(AllProductsResponse allProductsResponse) async {
    await DbHelper.dbHelper.addToFavourite(allProductsResponse);
    getAllProductsInFavourite();
    notifyListeners();
  }

  insertProductInCart(AllProductsResponse allProductsResponse) async {
    await DbHelper.dbHelper.addToCart(allProductsResponse);
    getAllProductsInCart();
  }

  getAllProductsInFavourite() async {
    List<Map<String, Object>> products = await DbHelper.dbHelper.getFavourite();
    allFavoiratProducts = products.map((e) {
      return AllProductsResponse.fromJson(e);
    }).toList();
    notifyListeners();
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

import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:e_commere/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<AllProductsResponse> categoryProducts;
  String selectedCategory;
  List<AllProductsResponse> allProducts;
  List<dynamic> allCategories;
  int currentPageIndex = 0;
  PageController pageController = PageController();

  HomeViewModel() {
    getAllProducts();
    getAllCategories();
  }

  getAllProducts() async {
    allProducts = await ApiService.apiHelper.getAllProducts();
    notifyListeners();
  }

  getAllCategories() async {
    allCategories = await ApiService.apiHelper.getAllCategory();
    notifyListeners();
  }
  selectCategory(String categoryName) {
    this.categoryProducts = null;
    this.selectedCategory = categoryName;
    getAllProductsInCategory();
    notifyListeners();
  }

  getAllProductsInCategory() async {
    categoryProducts = await ApiService.apiHelper
        .getAllProductsInCategory(selectedCategory);
    notifyListeners();
  }
  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }
}

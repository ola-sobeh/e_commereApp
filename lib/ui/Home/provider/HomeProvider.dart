import 'package:e_commere/ui/Home/model/AllProductsResponse.dart';
import 'package:e_commere/ui/Home/data/HomeApiHelper.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<AllProductsResponse> categoryProducts;
  String selectedCategory;
  List<AllProductsResponse> allProducts;
  List<dynamic> allCategories;
  int currentPageIndex = 0;
  PageController pageController = PageController();

  HomeProvider() {
    getAllProducts();
    getAllCategories();
  }

  getAllProducts() async {
    allProducts = await HomeApiHelper.apiHelper.getAllProducts();
    notifyListeners();
  }

  getAllCategories() async {
    allCategories = await HomeApiHelper.apiHelper.getAllCategory();
    notifyListeners();
  }
  selectCategory(String categoryName) {
    this.categoryProducts = null;
    this.selectedCategory = categoryName;
    getAllProductsInCategory();
    notifyListeners();
  }

  getAllProductsInCategory() async {
    categoryProducts = await HomeApiHelper.apiHelper
        .getAllProductsInCategory(selectedCategory);
    notifyListeners();
  }
  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }
}

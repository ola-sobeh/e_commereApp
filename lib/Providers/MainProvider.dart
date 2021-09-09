import 'package:flutter/cupertino.dart';

class MainProvider  extends ChangeNotifier{
  int currentPageIndex = 0;
  PageController pageController = PageController();

  changePageIndex(int newIndex) {
    pageController.jumpToPage(newIndex);
    this.currentPageIndex = newIndex;
    notifyListeners();
  }
}
import 'package:e_commere/view_models/main_view_model.dart';
import 'package:e_commere/views/CartPage.dart';
import 'package:e_commere/views/FavoritePage.dart';
import 'package:e_commere/views/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: Provider.of<MainViewModel>(context).pageController,
          children: [HomePage(), FavoritePage(), CartPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<MainViewModel>(context).currentPageIndex,
          onTap: (x) {
            Provider.of<MainViewModel>(context, listen: false).changePageIndex(x);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.house_outlined, color: Colors.pink[200]),
                label: "",
                activeIcon: Icon(
                  Icons.house,
                  color: Colors.pink[200],
                )),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
                color: Colors.pink[200],
              ),
              icon: Icon(Icons.favorite_outline_rounded, color: Colors.pink[200]),
              label: "",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.pink[200],
                ),
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.pink[200]),
                label: ""),
          ],
        ),
      ),
    );
  }
}

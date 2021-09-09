import 'package:e_commere/Providers/MainProvider.dart';
import 'package:e_commere/Providers/ThemeProvider.dart';
import 'package:e_commere/ui/pages/CartPage.dart';
import 'package:e_commere/ui/pages/FavoritePage.dart';
import 'package:e_commere/ui/pages/HomePage.dart';
import 'package:e_commere/ui/pages/MapPage.dart';
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
          controller: Provider.of<MainProvider>(context).pageController,
          children: [HomePage(), FavoritePage(), CartPage(), MapPage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<MainProvider>(context).currentPageIndex,
          onTap: (x) {
            Provider.of<MainProvider>(context, listen: false).changePageIndex(x);
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
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.map,
                  color: Colors.pink[200],
                ),
                icon: Icon(Icons.map_outlined, color: Colors.pink[200]),
                label: ""),
          ],
        ),
      ),
    );
  }
}

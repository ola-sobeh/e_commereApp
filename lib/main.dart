import 'package:e_commere/ui/Favorite/provider/FavoriteProvider.dart';
import 'package:e_commere/ui/Home/provider/HomeProvider.dart';
import 'package:e_commere/ui/cart/provider/CartProvider.dart';
import 'package:e_commere/ui/Main/ui/MainPage.dart';
import 'package:e_commere/helper/SqfliteHelper.dart';
import 'package:e_commere/ui/product/provider/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/Main/provider/MainProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<MainProvider>(
        create: (context) => MainProvider(),
      ),
      ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
      ),
      ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider()),
      ChangeNotifierProvider<FavoriteProvider>(
          create: (context) => FavoriteProvider()),
      ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider())
    ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainPage())),
  );
}

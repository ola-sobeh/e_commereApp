import 'package:e_commere/view_models/favorite_view_model.dart';
import 'package:e_commere/view_models/home_view_model.dart';
import 'package:e_commere/view_models/cart_view_model.dart';
import 'package:e_commere/views/MainPage.dart';
import 'package:e_commere/services/sqflite_service.dart';
import 'package:e_commere/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/main_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<MainViewModel>(
        create: (context) => MainViewModel(),
      ),
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(),
      ),
      ChangeNotifierProvider<ProductViewModel>(
          create: (context) => ProductViewModel()),
      ChangeNotifierProvider<FavoriteViewModel>(
          create: (context) => FavoriteViewModel()),
      ChangeNotifierProvider<CartViewModel>(
          create: (context) => CartViewModel())
    ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainPage())),
  );
}

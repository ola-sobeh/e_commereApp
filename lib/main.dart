
import 'package:e_commere/ui/pages/MainPage.dart';
import 'package:e_commere/helper/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/HomeProvider.dart';
import 'Providers/MainProvider.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<MainProvider>(
            create: (context) => MainProvider(),
          ),
          ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainPage())),
  );
}


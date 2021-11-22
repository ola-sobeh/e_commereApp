import 'dart:io';

import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();
  final String ProdectTable = "productTable";
  final String cartTable = "cartTable";
  final String columnId = "id";
  final String columnTitle = "title";
  final String columnPrice = "price";
  final String columnDescription = "Description";
  final String columnCategory = "category";
  final String columnImage = "image";
  final String cartProdectTable = "productTable";
  final String cartcolumnId = "id";
  final String cartcolumnTitle = "title";
  final String cartcolumnPrice = "price";
  final String cartcolumnDescription = "Description";
  final String cartcolumnCategory = "category";
  final String cartcolumnImage = "image";

  DbHelper._();

  Database database;

  initDatabase() async {
    database = await createDatabase();
  }

  Future<Database> createDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String directoryPath = directory.path;
    String databasePath = directoryPath + 'product.db';
    Database database =
        await openDatabase(databasePath, version: 1, onCreate: (db, v) {

      db.execute("CREATE TABLE $ProdectTable($columnId INTEGER PRIMARY KEY,"
          " $columnTitle TEXT, $columnPrice INTEGER , $columnDescription TEXT ,"
          " $columnCategory TEXT ,$columnImage TEXT )");
      db.execute("CREATE TABLE $cartTable($cartcolumnId INTEGER PRIMARY KEY,"
          " $cartcolumnTitle TEXT, $cartcolumnPrice INTEGER , $cartcolumnDescription TEXT ,"
          " $cartcolumnCategory TEXT ,$cartcolumnImage TEXT  )");
    });
    return database;
  }

  addToFavourite(AllProductsResponse product) async {
    int x = await database.insert(ProdectTable, product.toJson());
    print('favourite $x');
  }

  Future<List<Map<String, Object>>> getFavourite() async {
    List<Map<String, Object>> maps = await database.query(ProdectTable);
    return maps;
  }
  addToCart(AllProductsResponse product) async {
        int x = await database.insert(cartTable, product.toJson());
    print(x);
  }
  Future<List<Map<String, Object>>> getCart() async {
    List<Map<String, Object>> maps = await database.query(cartTable);
    return maps;
  }
  removeFromFavourite(int id) async {
    int x = await database
        .delete(ProdectTable, where: 'id=?', whereArgs: [id]);
    print(x);
  }


    removeFromCart(int id) async {
      int x =
      await database.delete(cartTable, where: 'id=?', whereArgs: [id]);
      print(x);
    }




/* Future<List<AllProductsResponse>> getAllProduct() async {
    var DB = await db;
    var result = await DB.query(ProdectTable);
    List<AllProductsResponse> products = result.map((e) =>AllProductsResponse.fromJson(e)).toList();
    return products;
  }
  Future<List<Map<String, Object>>> getFavourite() async {
    var DB = await db;
    List<Map<String, Object>> maps = await DB.query(ProdectTable);
    return maps;
  }
  Future<int> getCount() async {
    var DB = await db;
    return Sqflite.firstIntValue(
        await DB.rawQuery("SELECT COUNT(*) FROM $ProdectTable"));
  }

  Future<AllProductsResponse> getitem(int itemId) async {
    var DB = await db;
    var result = await DB
        .rawQuery("SELECT * FROM $ProdectTable WHERE $columnId = $itemId");
    if (result.length == 0) return null;
    return new AllProductsResponse.fromJson(result.first);
  }

  Future close() async {
    var DB = await db;
    return DB.close();
  }*/
}

import 'package:dio/dio.dart';
import 'package:e_commere/model/AllProductsResponse.dart';
import 'dart:math';
import 'package:e_commere/model/Product.dart';

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();
  Dio dio;
  String selectedCategory;

  ApiHelper._() {
    dio = Dio();
  }


  Future<List<AllProductsResponse>> getAllProducts(
      [int limit = 20, sort = 'desc']) async {
    String url = 'https://fakestoreapi.com/products?limit=$limit';
    Response response = await dio.get(url);
    List responses = response.data;
    List<AllProductsResponse> allProductsResponses =
        responses.map((e) => AllProductsResponse.fromJson(e)).toList();
    return allProductsResponses;
  }

  Future<List<dynamic>> getAllCategory() async {
    String url = 'https://fakestoreapi.com/products/categories';
    Response response = await Dio().get(url);
    return response.data;
  }

  String setSelectedCategory(String Category) {
    return this.selectedCategory;
  }

  Future<List<AllProductsResponse>> getAllProductsInCategory(
      String categoryName) async {
    try {
      String url = 'https://fakestoreapi.com/products/category/$categoryName';
      Response response = await dio.get(url);
      List responses = response.data;
      List<AllProductsResponse> allProductsResponses =
      responses.map((e) => AllProductsResponse.fromJson(e)).toList();
      return allProductsResponses;
    } on Exception catch (e) {
       print(e);
    }
  }
  Future<AllProductsResponse> getProductDetails(int id) async {
    String url = 'https://fakestoreapi.com/products/$id';
    Response response = await dio.get(url);
    AllProductsResponse allProductsResponse =
    AllProductsResponse.fromJson(response.data);
    return allProductsResponse;
  }

  Future<List<String>> getRandomProduct() async {
    Random random = new Random();
    List<String> listImges = List();
    int productnumber = 0;
    while (productnumber < 3) {
      productnumber++;
      int randomNumber = random.nextInt(20) + 1;
      String url = 'https://fakestoreapi.com/products/$randomNumber';
      Response response = await dio.get(url);
      print(randomNumber);
      Product product = Product.fromJson(response.data);
      listImges.add(product.image);
    }
    return listImges;
  }
}

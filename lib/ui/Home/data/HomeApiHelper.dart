import 'package:dio/dio.dart';
import 'package:e_commere/ui/Home/model/AllProductsResponse.dart';

class HomeApiHelper {
  HomeApiHelper._() {
    dio = Dio();
  }

  static HomeApiHelper apiHelper = HomeApiHelper._();
  Dio dio;

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

  Future<List<dynamic>> getAllCategory() async {
    String url = 'https://fakestoreapi.com/products/categories';
    Response response = await Dio().get(url);
    return response.data;
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
}

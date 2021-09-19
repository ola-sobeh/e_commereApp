import 'package:dio/dio.dart';
import 'package:e_commere/ui/Home/model/AllProductsResponse.dart';

class ProductApiHelper {
  Dio dio;
  static ProductApiHelper apiHelper = ProductApiHelper._();

  ProductApiHelper._() {
    dio = Dio();
  }
  Future<AllProductsResponse> getProductDetails(int id) async {
    String url = 'https://fakestoreapi.com/products/$id';
    Response response = await dio.get(url);
    AllProductsResponse allProductsResponse =
        AllProductsResponse.fromJson(response.data);
    return allProductsResponse;
  }
}

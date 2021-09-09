import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commere/Providers/HomeProvider.dart';
import 'package:e_commere/helper/apiHelper.dart';
import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:e_commere/ui/widgets/CategoryWidget.dart';
import 'package:e_commere/ui/widgets/ProductWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProductDetails.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.grey[800]),
        ),
        backgroundColor: Colors.white,
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, x) {
          List<AllProductsResponse> allProducts = provider.allProducts;
          List<AllProductsResponse> products = provider.categoryProducts;
          List<dynamic> categories = provider.allCategories;
          return Container(
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                allProducts == null
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink[300],
                        ),
                      )
                    : Container(
                        height: 180,
                        child: Carousel(
                          images: allProducts.take(4).map((element) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CachedNetworkImage(
                                        imageUrl: element.image));
                              },
                            );
                          }).toList(),
                          dotSize: 5.0,
                          dotSpacing: 15.0,
                          dotColor: Colors.pink[200],
                          indicatorBgPadding: 5.0,
                          dotBgColor: Colors.black12.withOpacity(0.5),
                          borderRadius: true,
                        ),
                      ),
                SizedBox(
                  height: 5,
                ),
                categories == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: provider.allCategories.map((e) {
                            return CategoryWidget(e);
                          }).toList(),
                        ),
                      ),
                SizedBox(
                  height: 5,
                ),
                products == null
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.pink[300],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Provider.of<HomeProvider>(context,
                                            listen: false)
                                        .getProductResponse(products[index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return ProductDetails();
                                    }));
                                  },
                                  child: ProductWidget(products[index]));
                            }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

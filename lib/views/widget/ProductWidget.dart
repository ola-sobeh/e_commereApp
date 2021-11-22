import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commere/view_models/favorite_view_model.dart';
import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:e_commere/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  AllProductsResponse product;
  ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(child: Text(product.title)),
                    Spacer(),
                    Text(
                      "${product.price.toString()}\$",
                      style: TextStyle(color: Colors.pink[300], fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Column(children: [
              IconButton(
                padding: EdgeInsets.fromLTRB(0, 20, 30, 0),
                onPressed: () {
                  Provider.of<FavoriteViewModel>(context, listen: false)
                      .insertProductInFavourite(product);
                },
                icon: Icon(
                  Icons.favorite_outline_rounded,
                  size: 27,
                  color: Colors.pink[300],
                ),
              ),
              IconButton(
                padding: EdgeInsets.fromLTRB(0, 20, 30, 0),
                onPressed: () {
                  Provider.of<CartViewModel>(context, listen: false)
                      .insertProductInCart(product);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 27,
                  color: Colors.pink[300],
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}

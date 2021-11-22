import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commere/model/AllProductsResponse.dart';
import 'package:e_commere/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  AllProductsResponse product;

  CartWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: CachedNetworkImage(imageUrl: product.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title),
                Text(product.price.toString()),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Provider.of<CartViewModel>(context, listen: false)
                    .deleteProductInCart(product.id, context);
              },
              icon: Icon(
                Icons.delete,
                size: 35,
                color: Colors.black54,
              ))
        ],
      ),
    );
  }
}

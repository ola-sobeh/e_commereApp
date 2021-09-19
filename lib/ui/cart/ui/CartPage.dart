import 'package:e_commere/ui/cart/provider/CartProvider.dart';
import 'package:e_commere/ui/cart/ui/CartWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Cart Page',style: TextStyle(color:Colors.grey[800]),
        ),
        backgroundColor: Colors.white,
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, x) {
          if (provider.allCartProducts == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: provider.allCartProducts.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: CartWidget(provider.allCartProducts[index]),
                  );
                });
          }
        },
      ),
    );
  }
}
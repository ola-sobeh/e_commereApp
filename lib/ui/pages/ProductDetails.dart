import 'package:e_commere/Providers/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, x) {
          return provider.product == null
              ? Center(
                  child: CircularProgressIndicator(color: Colors.pink[200]),
                )
              : Padding(
            padding:EdgeInsets.fromLTRB(10, 50, 10, 2),
                child: Column(
                      children: [
                        Container(
                          padding:EdgeInsets.only(top:10),
                          child: Image.network(provider.product.image),
                          height: MediaQuery.of(context).size.height/2.1,
                        ),
                        Padding(padding:EdgeInsets.symmetric(vertical:8)
                            ,child: Text(provider.product.title,)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                        Text(provider.product.description),
                        Padding(
                          padding:EdgeInsets.all(20),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${provider.product.price.toString()}\$",
                                style:
                                TextStyle(color: Colors.pink[400], fontSize: 20),
                              )),
                        ),
                      ],
                    ),
              );

        },
      ),
    );
  }
}

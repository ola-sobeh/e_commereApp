import 'package:e_commere/Providers/HomeProvider.dart';
import 'package:e_commere/ui/widgets/ProductWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProductDetails.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Favourite Page', style: TextStyle(color:Colors.grey[800]),
          ),
          backgroundColor: Colors.white,
        ),
        body: Consumer<HomeProvider>(
          builder: (context, provider, x) {
            if (provider.allFavoiratProducts == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: provider.allFavoiratProducts.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(provider
                                          .allFavoiratProducts[index].image)))),
                        ],
                      );
                    }),
              );
            }
          },
        ));
  }
}

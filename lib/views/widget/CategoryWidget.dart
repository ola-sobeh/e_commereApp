import 'package:e_commere/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  String title;

  CategoryWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<HomeViewModel>(context, listen: false).selectCategory(title);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Text(
          title.toString()[0].toUpperCase() + title.toString().substring(1),
          style: TextStyle(color: Colors.grey[800], fontSize: 18),
        ),
        decoration: BoxDecoration(
            color: Provider.of<HomeViewModel>(context).selectedCategory == title
                ? Colors.pink[300]
                : Colors.white70,
            borderRadius: BorderRadius.circular(15)),
        // color:,
      ),
    );
  }
}

import 'package:e_commere/helper/RouteHelper.dart';
import 'package:flutter/material.dart';

class CustomDialoug {
  CustomDialoug._();
  static CustomDialoug customDialoug = CustomDialoug._();
  showCustomDialoug(
  context,  String conteent, String title, Function yesFunction, int id) {
    showDialog(
        context:context,
        builder: (context) {
          return AlertDialog(
            content: Text(conteent),
            title: Text(title),
            actions: [
              TextButton(
                  onPressed: () {
                    yesFunction(id);
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }
}
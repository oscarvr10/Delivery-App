import 'package:flutter/material.dart';

class CustomSnackBar{
  static void show(BuildContext? context, String message){
    if(context == null)
      return;

    FocusScope.of(context).requestFocus(new FocusNode());
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 4),
        )
    );
  }
}
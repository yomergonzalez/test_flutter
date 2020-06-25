import 'package:flutter/material.dart';

class Functions {

  static showAlert(BuildContext context, AlertType type, String message){
    Color color;
    switch(type){
      case AlertType.ERROR:
         color = Colors.red;
        break;
      case AlertType.SUCCESS:
        color = Colors.green;
        break;
      case AlertType.INFO:
        color = Colors.lightBlueAccent;
        break;
    }
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
      backgroundColor: color,
    ));
  }
}


enum AlertType { ERROR, SUCCESS, INFO }
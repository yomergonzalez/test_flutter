
import 'package:flutter/material.dart';

class LoginStyles {

  static InputDecoration styleInput(String hint){
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.all(18.0),
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[100],
    );
  }

}
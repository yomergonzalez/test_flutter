import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextLoginField extends StatelessWidget {
  final String hint;
  final Function(String) validator;
  final Function(String) onSaved;

  const TextLoginField(
      {Key key,
      @required this.hint,
      @required this.validator,
      @required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var border = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        borderSide: BorderSide(color: Colors.transparent));

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder:border,
          focusedBorder: border,
          contentPadding: EdgeInsets.all(18.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[100],
        ),
        validator: this.validator,
        onSaved: this.onSaved,
      ),
    );
  }
}

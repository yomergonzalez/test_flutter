import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicButton extends StatelessWidget {

  final String title;
  final Function onPress;
  final bool loading;
  const DynamicButton({Key key, this.onPress, this.loading, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.all(10),
      child: MaterialButton(
        onPressed: loading==true ?  null: onPress,
        child: loading == true ? CupertinoActivityIndicator() : Text(title, style: TextStyle(fontSize: 17)),
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.grey,
        textColor: Colors.white,
      ),
    );
  }
}

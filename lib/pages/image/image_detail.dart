import 'package:animation/services/models/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final Photo photo;

  const ImageDetail({Key key,@required this.photo}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.network(photo.downloadUrl),
            ),
            Text("Autor: "+photo.author),
            Text("ID: "+photo.id),
            Text("Width: "+photo.width.toString()),
            Text("Height: "+photo.height.toString())
          ],
        ),
      )
    );
  }
}

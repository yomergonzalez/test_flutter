import 'package:animation/pages/image/image_detail.dart';
import 'package:animation/services/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoView extends StatelessWidget {

  final Photo photo;

  PhotoView({Key key, @required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageDetail(photo: this.photo))),
        child: Container(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: this.photo.downloadUrl,
            width: 150,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

import 'package:animation/services/models/photo.dart';

class GalleryResponse {
  List<Photo> data;

  GalleryResponse({this.data});

  GalleryResponse.fromJson( json) {
    if (json != null) {
      data = new List<Photo>();
      json.forEach((v) {
        data.add(new Photo.fromJson(v));
      });
    }
  }
}
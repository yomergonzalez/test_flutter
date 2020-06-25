import 'dart:convert';
import 'package:animation/services/models/gallery_response.dart';
import 'package:http/http.dart' as http;

class GalleryService {

  Future<GalleryResponse> getPhotos(int page) async {
    var url = 'https://picsum.photos/v2/list?page=' +
        page.toString() +
        '&amp;limit=15';
    var client = http.Client();

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return GalleryResponse.fromJson(json);

      } else {
        throw new Exception(response.body);
      }

    } finally {
      client.close();
    }
  }
}

import 'package:flutter_photoapp/model/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final apiKey = '31645494-99849d2438fe17bdb6f35e761';
  Future<List<Photo>> getPhotos(query) async {
    final response = await http
        .get(Uri.parse('$baseUrl?key=$apiKey&q=$query&image_type=photo'));
    Map<String, dynamic> decodeJson = jsonDecode(response.body);
    Iterable items = decodeJson['hits'];
    return items.map((e) => Photo.fromJson(e)).toList();
  }
}

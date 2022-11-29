import 'package:flutter_photoapp/model/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Photo>> getPhotos(query) async {
  final response = await http.get(Uri.parse(
      'https://pixabay.com/api/?key=${query}&q=yellow+flowers&image_type=photo'));
  Map<String, dynamic> decodeJson = jsonDecode(response.body);
  Iterable items = decodeJson['hits'];
  return items.map((e) => Photo.fromJson(e)).toList();
}

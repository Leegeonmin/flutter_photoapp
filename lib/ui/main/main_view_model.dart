import 'package:flutter_photoapp/data/api.dart';
import 'package:flutter_photoapp/model/photo.dart';
import 'dart:async';

class MainViewModel {
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final result = await api.getPhotos(query);
    _photoStreamController.add(result);
  }

  MainViewModel(this.api);
}

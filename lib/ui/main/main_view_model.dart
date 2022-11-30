import 'package:flutter_photoapp/data/pixabay_api.dart';
import 'package:flutter_photoapp/data/photo_api_repository.dart';
import 'package:flutter_photoapp/model/photo.dart';
import 'dart:async';

class MainViewModel {
  final PhotoApiRepository repository;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }

  MainViewModel(this.repository);
}

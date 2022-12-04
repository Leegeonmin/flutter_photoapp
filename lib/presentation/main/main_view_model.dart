import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_photoapp/domain/repository/photo_api_repository.dart';
import 'dart:async';
import 'package:flutter_photoapp/domain/model/photo.dart';

class MainViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photoList = [];
// error throwing type
  UnmodifiableListView<Photo> get photoList => UnmodifiableListView(_photoList);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoList = result;
    notifyListeners();
  }

  MainViewModel({required this.repository});
}

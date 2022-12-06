import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_photoapp/data/data_source/result.dart';
import 'package:flutter_photoapp/domain/repository/photo_api_repository.dart';
import 'dart:async';
import 'package:flutter_photoapp/domain/model/photo.dart';
import 'package:flutter_photoapp/presentation/main/home_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photoList = [];
// error throwing type
  UnmodifiableListView<Photo> get photoList => UnmodifiableListView(_photoList);

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  Future<void> fetch(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);
    result.when(success: (photos) {
      _photoList = photos;
      notifyListeners();
    }, error: (message) {
      print(message);
      _eventController.add(HomeUiEvent.showSnackBar(message));
    });
  }

  MainViewModel({required this.repository});
}

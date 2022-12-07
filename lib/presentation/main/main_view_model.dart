import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter_photoapp/data/data_source/result.dart';
import 'package:flutter_photoapp/domain/repository/photo_api_repository.dart';
import 'dart:async';
import 'package:flutter_photoapp/domain/model/photo.dart';
import 'package:flutter_photoapp/presentation/main/home_state.dart';
import 'package:flutter_photoapp/presentation/main/home_ui_event.dart';

class MainViewModel with ChangeNotifier {
  final PhotoApiRepository repository;
  HomeState _state = HomeState([], false);
  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);

    notifyListeners();
    final Result<List<Photo>> result = await repository.fetch(query);
    result.when(success: (photos) {
      _state = state.copyWith(photos: photos);
      notifyListeners();
    }, error: (message) {
      print(message);
      _eventController.add(HomeUiEvent.showSnackBar(message));
    });
    _state = state.copyWith(isLoading: false);

    notifyListeners();
  }

  MainViewModel({required this.repository});
}

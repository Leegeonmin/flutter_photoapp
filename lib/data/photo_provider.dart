import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_photoapp/data/api.dart';
import 'package:flutter_photoapp/model/photo.dart';

class PhotoProvider extends InheritedWidget {
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  final PixabayApi api;
  PhotoProvider({Key? key, required this.api, required Widget child})
      : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'no pixa api');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.getPhotos(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}

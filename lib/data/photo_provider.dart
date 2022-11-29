import 'package:flutter/material.dart';
import 'package:flutter_photoapp/data/api.dart';
import 'package:flutter_photoapp/model/photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;
  const PhotoProvider({Key? key, required this.api, required Widget child})
      : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'no pixa api');
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}

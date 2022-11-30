import 'package:flutter/material.dart';
import 'package:flutter_photoapp/data/pixabay_api.dart';
import 'package:flutter_photoapp/model/photo.dart';
import 'package:flutter_photoapp/ui/main/main_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final MainViewModel viewModel;
  PhotoProvider({Key? key, required this.viewModel, required Widget child})
      : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'no pixa api');
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}

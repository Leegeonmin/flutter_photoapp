import 'package:flutter/material.dart';
import 'package:flutter_photoapp/data/api.dart';
import 'package:flutter_photoapp/data/photo_provider.dart';
import 'package:flutter_photoapp/ui/main/main_view.dart';
import 'package:flutter_photoapp/ui/main/main_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: PhotoProvider(
          viewModel: MainViewModel(PixabayApi()), child: const MainPage()),
    );
  }
}

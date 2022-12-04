import 'package:flutter/material.dart';
import 'package:flutter_photoapp/data/pixabay_api.dart';
import 'package:flutter_photoapp/ui/screen/main/main_view.dart';
import 'package:flutter_photoapp/ui/screen/main/main_view_model.dart';
import 'package:provider/provider.dart';

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
      home: Provider(
          create: (_) => MainViewModel(PixabayApi()), child: const MainPage()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_photoapp/data/photo_provider.dart';
import 'package:flutter_photoapp/view/component/photo_widget.dart';
import 'package:flutter_photoapp/model/photo.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _searchBadTextEditingController = TextEditingController();

  List<Photo> _photos = [];

  @override
  void dispose() {
    _searchBadTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoProvider = PhotoProvider.of(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "이미지 검색 앱",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextField(
                controller: _searchBadTextEditingController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          final data = await photoProvider.api
                              .getPhotos(_searchBadTextEditingController.text);
                          setState(() {
                            _photos = data;
                          });
                        },
                        icon: const Icon(Icons.search))),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              Expanded(
                child: GridView.builder(
                  itemCount: _photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return PhotoWidget(
                      photo: _photos[index],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

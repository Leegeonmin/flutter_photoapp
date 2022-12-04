import 'package:flutter/material.dart';
import 'package:flutter_photoapp/presentation/main/component/photo_widget.dart';
import 'package:flutter_photoapp/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _searchBadTextEditingController = TextEditingController();

  @override
  void dispose() {
    _searchBadTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final photos = viewModel.photoList;
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
                          setState(() {
                            viewModel
                                .fetch(_searchBadTextEditingController.text);
                          });
                        },
                        icon: const Icon(Icons.search))),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              Expanded(
                child: viewModel.photoList.isEmpty
                    ? Center(child: Text("검색어를 입력해보세요."))
                    : GridView.builder(
                        itemCount: photos.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                        itemBuilder: (context, index) {
                          return PhotoWidget(
                            photo: photos[index],
                          );
                        },
                      ),
              )
            ],
          ),
        ));
  }
}
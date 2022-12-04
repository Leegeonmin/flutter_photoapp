import 'package:flutter_photoapp/data/data_source/pixabay_api.dart';
import 'package:flutter_photoapp/domain/repository/photo_api_repository.dart';
import 'package:flutter_photoapp/domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);
  @override
  Future<List<Photo>> fetch(query) async {
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}

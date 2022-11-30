import 'package:flutter_photoapp/data/api.dart';
import 'package:flutter_photoapp/ui/main/main_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_photoapp/model/photo.dart';

void main() {
  test('Stream이 잘 동작해야한다', () async {
    final viewModel = MainViewModel(PixabayApi());
    await viewModel.fetch('apple');
    await viewModel.fetch('apple');

    expect(
        viewModel.photoStream,
        emitsInOrder([
          isA<List<Photo>>(),
          isA<List<Photo>>(),
        ]));
  });
}

import 'package:flutter_photoapp/data/pixabay_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('pixabay 데이터를 잘 가져와야한다', () async {
    final api = PixabayApi();
    final result = await api.fetch('iphone');

    expect(result.length, 20);
  });
}

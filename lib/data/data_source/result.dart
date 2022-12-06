import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  // 새로운 인스턴스를 생성하지 않는 생성자를 구현할 때 factory 키워드를 사용하라고 한다. => 싱글톤

  const factory Result.success(T data) = Success;
  const factory Result.error(String e) = Error;
}

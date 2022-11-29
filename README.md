# flutter_photoapp

클린 아키텍처를 공부하기 위한 repository

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 11-29

- view
  - screen
    - mainview
  - component
    - photo_widget
- model
  - photo
- data
  - api
  - photo_provider

기존 구조는 view - data 로 구분하여
view에서 data class를 의존하여 view에 필요한 데이터가 늘어날 경우 view에 포함된 data class가 늘어남

-> inheritedWidget을 상속받은 PhotoProvider를 상위 위젯으로 사용하여 view가 데이터 클래스 직접 사용하는 문제 해결하고 불필요한 위젯간 데이터 전달 없이 pixabayApi 참조 가능하게함

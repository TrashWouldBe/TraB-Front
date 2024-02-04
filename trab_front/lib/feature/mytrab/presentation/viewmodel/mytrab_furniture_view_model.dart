import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mytrab_furniture_view_model.g.dart';

class MyTrabFurnitureScreenState {
  MyTrabFurnitureScreenState({required this.trabSay});
  String trabSay;
}

@riverpod
class MyTrabFurnitureScreenController
    extends _$MyTrabFurnitureScreenController {
  @override
  MyTrabFurnitureScreenState build() {
    return MyTrabFurnitureScreenState(trabSay: "안녕하세요!");
  }
}

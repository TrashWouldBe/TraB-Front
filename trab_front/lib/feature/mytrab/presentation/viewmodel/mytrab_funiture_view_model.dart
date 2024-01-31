import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mytrab_funiture_view_model.g.dart';

class MyTrabFunitureScreenState {
  MyTrabFunitureScreenState({required this.trabSay});
  String trabSay;
}

@riverpod
class MyTrabFunitureScreenController extends _$MyTrabFunitureScreenController {
  @override
  MyTrabFunitureScreenState build() {
    return MyTrabFunitureScreenState(trabSay: "안녕하세요!");
  }
}

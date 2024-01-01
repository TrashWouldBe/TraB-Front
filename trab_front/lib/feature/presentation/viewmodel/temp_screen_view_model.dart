import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'temp_screen_view_model.g.dart';

class TempScreenState {
  int count;
  TempScreenState({
    required this.count,
  });
}

@riverpod
class TempScreenController extends _$TempScreenController {
  @override
  TempScreenState build() {
    return TempScreenState(
      count: 0,
    );
  }

  //상태 업데이트
  void setState() {
    state = TempScreenState(count: state.count);
  }

  //상태 핸들러
  void handleButtonPressed() {
    state.count += 1;
    print(state.count);
    setState();
  }
}

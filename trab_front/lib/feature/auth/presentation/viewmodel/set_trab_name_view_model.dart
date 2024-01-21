import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_trab_name_view_model.g.dart';

class SetTrabNameScreenState {
  FocusNode focusNode;
  SetTrabNameScreenState({required this.focusNode});
}

@riverpod
class SetTrabNameScreenController extends _$SetTrabNameScreenController {
  @override
  SetTrabNameScreenState build() {
    return SetTrabNameScreenState(focusNode: FocusNode());
  }

  void init() {
    state.focusNode.addListener(() {
      state = SetTrabNameScreenState(focusNode: state.focusNode);
    });
  }
}

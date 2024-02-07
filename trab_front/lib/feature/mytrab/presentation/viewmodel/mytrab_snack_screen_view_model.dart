import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/feature/mytrab/domain/trab_domain.dart';

part 'mytrab_snack_screen_view_model.g.dart';

class MyTrabSnackScreenState {
  MyTrabSnackScreenState();
}

@riverpod
class MyTrabSnackScreenController extends _$MyTrabSnackScreenController {
  @override
  MyTrabSnackScreenState build() {
    return MyTrabSnackScreenState();
  }

  void init() async {
    Loading.show();
    await ref.read(trabControllerProvider.notifier).getTrabTotalSnack();
    await ref
        .read(trabControllerProvider.notifier)
        .getTrabTotalSnackTrashList();
    Loading.close();
  }
}

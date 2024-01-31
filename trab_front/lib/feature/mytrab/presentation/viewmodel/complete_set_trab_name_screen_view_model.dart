import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';

part 'complete_set_trab_name_screen_view_model.g.dart';

class CompleteSetTrabNameScreenState {
  CompleteSetTrabNameScreenState();
}

@riverpod
class CompleteSetTrabNameScreenController
    extends _$CompleteSetTrabNameScreenController {
  @override
  CompleteSetTrabNameScreenState build() {
    return CompleteSetTrabNameScreenState();
  }

  void handlePressedContainerButton() {
    AppRouter.pushNamed(Routes.HomeScreenRoute);
  }
}

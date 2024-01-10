import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';

part 'flogging_start_screen_view_model.g.dart';

class FloggingStartScreenState {
  int selectedPage;
  FloggingStartScreenState({required this.selectedPage});
}

@riverpod
class FloggingStartScreenController extends _$FloggingStartScreenController {
  @override
  FloggingStartScreenState build() {
    return FloggingStartScreenState(
      selectedPage: 0,
    );
  }

  void setState() {
    state = FloggingStartScreenState(selectedPage: state.selectedPage);
  }

  void onPageChanged(int index) {
    state.selectedPage = index;
    setState();
  }

  void handleTapStartButton() {
    AppRouter.pushNamed(Routes.FloggingTimerScreenRoute);
  }
}

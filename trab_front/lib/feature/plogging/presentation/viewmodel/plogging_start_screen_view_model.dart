import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
part 'plogging_start_screen_view_model.g.dart';

class PloggingStartScreenState {
  int selectedPage;
  PloggingStartScreenState({required this.selectedPage});
}

@riverpod
class PloggingStartScreenController extends _$PloggingStartScreenController {
  @override
  PloggingStartScreenState build() {
    return PloggingStartScreenState(
      selectedPage: 0,
    );
  }

  void setState() {
    state = PloggingStartScreenState(selectedPage: state.selectedPage);
  }

  void onPageChanged(int index) {
    state.selectedPage = index;
    setState();
  }

  void handleTapStartButton() {
    AppRouter.pushAndRemoveUntil(Routes.PloggingCountScreenRoute);
  }
}

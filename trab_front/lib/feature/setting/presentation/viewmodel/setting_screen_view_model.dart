import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';

part 'setting_screen_view_model.g.dart';

class SettingScreenState {
  SettingScreenState();
}

@riverpod
class SettingScreenController extends _$SettingScreenController {
  @override
  SettingScreenState build() {
    return SettingScreenState();
  }

  void handleTapFlogginRecord() {
    AppRouter.pushNamed(Routes.FloggingRecordScreenRoute);
  }
}

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/auth/domain/user_domain.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/helpers/constants/app_uris.dart';

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
    AppRouter.pushNamed(Routes.PloggingRecordScreenRoute);
  }

  Future<void> getImage({required ImageSource imageSource}) async {
    Loading.show();
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      File img = File(image.path);
      await ref
          .read(userControllerProvider.notifier)
          .patchUserImage(file: img.path);
    }

    Loading.close();
    AppRouter.pop();
  }

  void handlePressedMethod() async {
    await launchInWebViewOrVC(
      url: Uris.notion(NotionUrls.METHOD),
    );
  }

  void handlePressedInvidualQuery() async {
    await launchInWebViewOrVC(
      url: Uris.notion(NotionUrls.INVIDUALQUERY),
    );
  }

  void handlePressedTermsOfUse() async {
    await launchInWebViewOrVC(
      url: Uris.notion(NotionUrls.TERMSOFUSE),
    );
  }
}

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';

part 'camera_screen_view_model.g.dart';

class CameraScreenState {
  File? image;
  CameraScreenState({required this.image});
}

@riverpod
class CameraScreenController extends _$CameraScreenController {
  @override
  CameraScreenState build() {
    return CameraScreenState(image: null);
  }

  void setState() {
    state = CameraScreenState(image: state.image);
  }

  Future<void> getImage({required ImageSource imageSource}) async {
    state.image = null;
    setState();
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      File img = File(image.path);
      state.image = img;
      setState();
    }
  }

  void handlePressedContainerButton() async {
    await getImage(imageSource: ImageSource.camera);
    if (state.image != null) {
      AppRouter.pushNamed(Routes.SortedTrashScreenRoute);
    }
  }
}

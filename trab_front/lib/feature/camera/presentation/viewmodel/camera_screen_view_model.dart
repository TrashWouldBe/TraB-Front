import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';
import 'package:trab_front/feature/camera/domain/image_domin.dart';
import 'package:trab_front/feature/common/widget/loading.dart';

part 'camera_screen_view_model.g.dart';

class CameraScreenState {
  ImageModel? imageModel;
  CameraScreenState({required this.imageModel});
}

@riverpod
class CameraScreenController extends _$CameraScreenController {
  @override
  CameraScreenState build() {
    return CameraScreenState(imageModel: null);
  }

  void setState() {
    state = CameraScreenState(imageModel: state.imageModel);
  }

  Future<void> getImage({required ImageSource imageSource}) async {
    setState();
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image != null) {
      File img = File(image.path);
      state.imageModel = await ref
          .read(imageControllerProvider.notifier)
          .postImage(file: img.path);
    } else {
      state.imageModel = null;
    }
    setState();
  }

  void handlePressedContainerButton() async {
    Loading.show();
    await getImage(imageSource: ImageSource.camera);
    Loading.close();
    if (state.imageModel != null) {
      AppRouter.pushNamed(Routes.SortedTrashScreenRoute);
    }
  }
}

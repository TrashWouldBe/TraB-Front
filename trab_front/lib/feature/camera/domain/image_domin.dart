import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/camera/data/dataSource/image_data_source.dart';

part 'image_domin.g.dart';

class ImageState {
  ImageDataSource imageDataSource;

  ImageState({required this.imageDataSource});
}

@riverpod
class ImageController extends _$ImageController {
  @override
  ImageState build() {
    return ImageState(
      imageDataSource:
          ImageDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  void setState() {
    state = ImageState(
      imageDataSource: state.imageDataSource,
    );
  }

  Future<void> postImage({required file}) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          file,
          filename: 'image.png',
        )
      });
      await state.imageDataSource.postImage(data: formData);
    } catch (error) {
      print(error);
    }
  }
}

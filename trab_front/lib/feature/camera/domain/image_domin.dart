import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/camera/data/dataSource/image_data_source.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';

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
      imageDataSource: ImageDataSource(
        apiService: ref.watch(
          apiServiceProvider,
        ),
      ),
    );
  }

  void setState() {
    state = ImageState(
      imageDataSource: state.imageDataSource,
    );
  }

  Future<ImageModel?> postImage({required String file}) async {
    try {
      FormData formData = FormData.fromMap(
        {
          'image': await MultipartFile.fromFile(
            file,
            filename: 'image.png',
          )
        },
      );
      ImageModel? imageModel =
          await state.imageDataSource.postImage(data: formData);
      return imageModel;
    } catch (error) {
      print(error);
    }
    return null;
  }
}

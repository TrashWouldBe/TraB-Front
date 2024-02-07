import 'package:dio/dio.dart';
import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';

class ImageDataSource {
  final ApiService _apiService;

  ImageDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<ImageModel> postImage({required FormData data}) async {
    return _apiService.setDataWithImage(
      endpoint: ApiEndpoint.image(ImageEndPoint.Image),
      data: data,
      converter: (response) {
        return ImageModel.fromJson(response.body);
      },
    );
  }
}

import 'package:dio/dio.dart';
import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';

class ImageDataSource {
  final ApiService _apiService;

  ImageDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<void> postImage({required FormData data}) async {
    return _apiService.setDataWithImage(
      endpoint: ApiEndpoint.image(ImageEndPoint.Image),
      data: data,
      converter: (response) {
        print(response);
        // return response.body;
      },
    );
  }
}

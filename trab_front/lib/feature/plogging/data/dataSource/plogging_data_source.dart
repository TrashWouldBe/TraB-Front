import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';

class PloggingDataSource {
  final ApiService _apiService;

  PloggingDataSource({required ApiService apiService})
      : _apiService = apiService;

  Future<void> getPloggingList() async {
    return _apiService.getDocumentData<void>(
      endpoint: ApiEndpoint.plogging(PloggingEndPoint.LIST),
      converter: (response) {
        print(response);
        // return PloggingModel.fromJson(response.body);
      },
    );
  }
}

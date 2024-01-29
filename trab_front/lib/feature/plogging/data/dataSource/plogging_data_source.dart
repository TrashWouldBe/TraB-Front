import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';
import 'package:trab_front/feature/plogging/data/model/plogging_model.dart';

class PloggingDataSource {
  final ApiService _apiService;

  PloggingDataSource({required ApiService apiService})
      : _apiService = apiService;

  Future<List<PloggingModel>> getPloggingList() async {
    return _apiService.getDocumentData<List<PloggingModel>>(
      endpoint: ApiEndpoint.plogging(PloggingEndpoint.LIST),
      converter: (response) {
        return PloggingModel.fromJsonList(response.body);
      },
    );
  }
}

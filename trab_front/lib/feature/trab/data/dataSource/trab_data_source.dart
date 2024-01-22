import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';
import 'package:trab_front/feature/trab/data/model/trab_model.dart';
import 'package:trab_front/helpers/typedefs.dart';

class TrabDataSource {
  final ApiService _apiService;

  TrabDataSource({required ApiService apiService}) : _apiService = apiService;

  Future<TrabModel?> getTrab() async {
    return _apiService.getDocumentData<TrabModel?>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.TRAB),
      converter: (response) {
        if (response.body == null) {
          return null;
        }
        return TrabModel.fromJson(response.body);
      },
    );
  }

  Future<TrabModel?> postTrab({required JSON data}) async {
    return _apiService.setData<TrabModel?>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.TRAB),
      data: data,
      converter: (response) {
        if (response.body == null) {
          return null;
        }
        return TrabModel.fromJson(response.body);
      },
    );
  }
}

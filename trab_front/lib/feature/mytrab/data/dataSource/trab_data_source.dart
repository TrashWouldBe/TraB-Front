import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';
import 'package:trab_front/feature/myTrab/data/model/trab_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_funiture_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_trash_list_model.dart';
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

  Future<List<TrabFunitureModel>> getTrabFunitureList() async {
    return _apiService.getDocumentData<List<TrabFunitureModel>>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.FUNITURE_LIST),
      converter: (response) {
        return TrabFunitureModel.fromJsonList(response.body);
      },
    );
  }

  // Future<void> getTrabFunitureInfo() async {
  //   return _apiService.getDocumentData<void>(
  //     endpoint: ApiEndpoint.trab(TrabEndpoint.FUNITURE_INFO),
  //     converter: (response) {},
  //   );
  // }

  Future<List<TrabFunitureModel>> getTrabFunitureArranged() async {
    return _apiService.getDocumentData<List<TrabFunitureModel>>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.FUNITURE_ARRANGED),
      converter: (response) {
        return TrabFunitureModel.fromJsonList(response.body);
      },
    );
  }

  Future<TrabFunitureModel> patchTrabFuniture({required JSON data}) async {
    return _apiService.setData<TrabFunitureModel>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.FUNITURE),
      data: data,
      converter: (response) {
        return TrabFunitureModel.fromJson(response.body);
      },
    );
  }

  Future<TrabSnackModel> getTrabSnack() async {
    return _apiService.getDocumentData<TrabSnackModel>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.SNACK),
      converter: (response) {
        return TrabSnackModel.fromJson(response.body);
      },
    );
  }

  Future<List<TrabTrashListModel>> getTrabSnackTrashList(
      {required int trabId}) async {
    return _apiService.getDocumentData<List<TrabTrashListModel>>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.SNACK_TRASH_LIST),
      queryParams: {
        "trab_id": trabId,
      },
      converter: (response) {
        return TrabTrashListModel.fromJsonList(response.body);
      },
    );
  }
}

import 'package:trab_front/core/network/api_endpoint.dart';
import 'package:trab_front/core/network/api_service.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_furniture_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
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

  Future<TrabModel?> patchTrab(
      {required JSON data, required int? trabId}) async {
    return _apiService.updateData<TrabModel?>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.TRAB),
      queryParams: {
        "trab_id": trabId,
      },
      data: data,
      converter: (response) {
        return TrabModel.fromJson(response.body);
      },
    );
  }

  Future<List<TrabFurnitureModel>> getTrabFunitureList() async {
    return _apiService.getDocumentData<List<TrabFurnitureModel>>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.FURNITURE_LIST),
      converter: (response) {
        return TrabFurnitureModel.fromJsonList(response.body);
      },
    );
  }

  Future<void> patchTrabFurnitureArrage(
      {required String funitureName, required int? trabId}) async {
    return _apiService.updateData<void>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.FURNITURE_ARRANGE),
      queryParams: {
        "trab_id": trabId,
        "furniture_name": funitureName,
      },
      data: {},
      converter: (response) {},
    );
  }

  Future<TrabFurnitureModel> patchTrabFurniture(
      {required JSON data, required int? trabId}) async {
    return _apiService.updateData<TrabFurnitureModel>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.FURNITURE),
      queryParams: {
        "trab_id": trabId,
      },
      data: data,
      converter: (response) {
        return TrabFurnitureModel.fromJson(response.body);
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

  Future<TrabSnackModel> getTrabTotalSnack() async {
    return _apiService.getDocumentData<TrabSnackModel>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.SNACK_TOTAL),
      converter: (response) {
        return TrabSnackModel.fromJson(response.body);
      },
    );
  }

  Future<List<ImageModel>> getTrabSnackTrashList({required int? trabId}) async {
    return _apiService.getDocumentData<List<ImageModel>>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.SNACK_TRASH_LIST),
      queryParams: {
        "trab_id": trabId,
      },
      converter: (response) {
        return ImageModel.fromJsonList(response.body);
      },
    );
  }

  Future<List<ImageModel>> getTrabTotalSnackTrashList(
      {required int? trabId}) async {
    return _apiService.getDocumentData<List<ImageModel>>(
      endpoint: ApiEndpoint.trab(TrabEndpoint.SNACK_TRASH_TOTAL_LIST),
      queryParams: {
        "trab_id": trabId,
      },
      converter: (response) {
        return ImageModel.fromJsonList(response.body);
      },
    );
  }
}

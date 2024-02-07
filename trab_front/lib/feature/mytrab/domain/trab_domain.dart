import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';
import 'package:trab_front/feature/mytrab/data/dataSource/trab_data_source.dart';

import 'package:trab_front/feature/mytrab/data/model/trab_furniture_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_domain.g.dart';

class TrabState {
  TrabDataSource trabDataSource;
  List<TrabFurnitureModel> trabFurniture;
  List<ImageModel> trabTrashList;
  List<ImageModel> trabTotalTrashList;
  TrabSnackModel? trabSnack;
  TrabSnackModel? trabTotalSnack;
  TrabModel? trab;
  TrabState({
    required this.trabDataSource,
    this.trab,
    required this.trabFurniture,
    required this.trabTotalTrashList,
    this.trabSnack,
    this.trabTotalSnack,
    required this.trabTrashList,
  });
}

@Riverpod(keepAlive: true)
class TrabController extends _$TrabController {
  @override
  TrabState build() {
    return TrabState(
      trabFurniture: [],
      trabTrashList: [],
      trabTotalTrashList: [],
      trabDataSource: TrabDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  void setState() {
    state = TrabState(
        trabSnack: state.trabSnack,
        trabTotalTrashList: state.trabTotalTrashList,
        trabTrashList: state.trabTrashList,
        trabFurniture: state.trabFurniture,
        trabTotalSnack: state.trabTotalSnack,
        trabDataSource: state.trabDataSource,
        trab: state.trab);
  }

  Future<TrabModel?> getTrab() async {
    try {
      TrabModel? trabInfo = await state.trabDataSource.getTrab();
      state.trab = trabInfo;
      setState();
      return trabInfo;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<TrabModel?> postTrab({required JSON data}) async {
    try {
      TrabModel? trabInfo = await state.trabDataSource.postTrab(data: data);
      print(trabInfo);
      state.trab = trabInfo;
      setState();
      return trabInfo;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<void> patchTrab({required JSON data}) async {
    try {
      TrabModel? userInfo = await state.trabDataSource
          .patchTrab(data: data, trabId: state.trab?.trabId);
      state.trab = userInfo;
      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> getTrabFunitureList() async {
    try {
      state.trabFurniture = await state.trabDataSource
          .getTrabFunitureList(trabId: state.trab?.trabId);
      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> patchTrabFurnitureArrange({required String funitureName}) async {
    try {
      await state.trabDataSource.patchTrabFurnitureArrage(
          funitureName: funitureName, trabId: state.trab?.trabId);
      await getTrabSnack();
      await getTrabFunitureList();
    } catch (error) {
      print(error);
    }
  }

  Future<void> patchTrabFurniture({required JSON data}) async {
    try {
      await state.trabDataSource
          .patchTrabFurniture(data: data, trabId: state.trab?.trabId);
      await getTrabSnack();
      await getTrabFunitureList();
    } catch (error) {
      print(error);
    }
  }

  Future<void> getTrabSnack() async {
    try {
      state.trabSnack =
          await state.trabDataSource.getTrabSnack(trabId: state.trab?.trabId);
      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> getTrabTotalSnack() async {
    try {
      state.trabTotalSnack = await state.trabDataSource
          .getTrabTotalSnack(trabId: state.trab?.trabId);
      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> getTrabSnackTrashList() async {
    try {
      state.trabTrashList = await state.trabDataSource
          .getTrabSnackTrashList(trabId: state.trab?.trabId);

      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> getTrabTotalSnackTrashList() async {
    try {
      state.trabTotalTrashList = await state.trabDataSource
          .getTrabTotalSnackTrashList(trabId: state.trab?.trabId);

      setState();
    } catch (error) {
      print(error);
    }
  }
}

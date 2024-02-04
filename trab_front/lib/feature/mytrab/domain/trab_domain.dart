import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/mytrab/data/dataSource/trab_data_source.dart';

import 'package:trab_front/feature/mytrab/data/model/trab_furniture_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_trash_list_model.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_domain.g.dart';

class TrabState {
  TrabDataSource trabDataSource;
  List<TrabFurnitureModel> trabFurniture;
  List<TrabTrashListModel> trabTrashList;
  TrabSnackModel? trabSnack;
  TrabModel? trab;
  TrabState({
    required this.trabDataSource,
    this.trab,
    required this.trabFurniture,
    this.trabSnack,
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
      trabDataSource: TrabDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  void setState() {
    state = TrabState(
        trabSnack: state.trabSnack,
        trabTrashList: state.trabTrashList,
        trabFurniture: state.trabFurniture,
        trabDataSource: state.trabDataSource,
        trab: state.trab);
  }

  Future<TrabModel?> getTrab() async {
    try {
      TrabModel? userInfo = await state.trabDataSource.getTrab();
      state.trab = userInfo;
      setState();
      return userInfo;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<TrabModel?> postTrab({required JSON data}) async {
    try {
      TrabModel? userInfo = await state.trabDataSource.postTrab(data: data);
      state.trab = userInfo;
      setState();
      return userInfo;
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
      state.trabFurniture = await state.trabDataSource.getTrabFunitureList();
      setState();
    } catch (error) {
      print(error);
    }
  }

  // Future<void> getTrabFunitureInfo() async {
  //   try {
  //     await state.trabDataSource.getTrabFunitureInfo();
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Future<void> getTrabFunitureArranged() async {
    try {
      await state.trabDataSource.getTrabFurnitureArranged();
    } catch (error) {
      print(error);
    }
  }

  Future<void> patchTrabFurniture({required JSON data}) async {
    try {
      await state.trabDataSource.patchTrabFurniture(data: data);
    } catch (error) {
      print(error);
    }
  }

  Future<void> getTrabSnack() async {
    try {
      state.trabSnack = await state.trabDataSource.getTrabSnack();
      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> getTrabSnackTrashList() async {
    try {
      int? trabId = ref.read(trabControllerProvider).trab?.trabId;

      if (trabId != null) {
        state.trabTrashList =
            await state.trabDataSource.getTrabSnackTrashList(trabId: trabId);
        setState();
      }
    } catch (error) {
      print(error);
    }
  }
}

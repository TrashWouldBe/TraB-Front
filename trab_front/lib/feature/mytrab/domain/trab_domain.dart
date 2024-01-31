import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';

import 'package:trab_front/feature/myTrab/data/dataSource/trab_data_source.dart';
import 'package:trab_front/feature/myTrab/data/model/trab_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_funiture_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_trash_list_model.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_domain.g.dart';

class TrabState {
  TrabDataSource trabDataSource;
  List<TrabFunitureModel> trabFuniture;
  List<TrabTrashListModel> trabTrashList;
  TrabSnackModel? trabSnack;
  TrabModel? trab;
  TrabState({
    required this.trabDataSource,
    this.trab,
    required this.trabFuniture,
    this.trabSnack,
    required this.trabTrashList,
  });
}

@riverpod
class TrabController extends _$TrabController {
  @override
  TrabState build() {
    return TrabState(
      trabFuniture: [],
      trabTrashList: [],
      trabDataSource: TrabDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  void setState() {
    state = TrabState(
        trabSnack: state.trabSnack,
        trabTrashList: state.trabTrashList,
        trabFuniture: state.trabFuniture,
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

  Future<void> getTrabFunitureList() async {
    try {
      state.trabFuniture = await state.trabDataSource.getTrabFunitureList();
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
      await state.trabDataSource.getTrabFunitureArranged();
    } catch (error) {
      print(error);
    }
  }

  Future<void> patchTrabFuniture({required JSON data}) async {
    try {
      await state.trabDataSource.patchTrabFuniture(data: data);
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

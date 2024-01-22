import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';

import 'package:trab_front/feature/trab/data/dataSource/trab_data_source.dart';
import 'package:trab_front/feature/trab/data/model/trab_model.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_domain.g.dart';

class TrabState {
  TrabDataSource userDataSource;
  TrabModel? trab;
  TrabState({required this.userDataSource, this.trab});
}

@riverpod
class TrabController extends _$TrabController {
  @override
  TrabState build() {
    return TrabState(
      userDataSource: TrabDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  void setState() {
    state = TrabState(userDataSource: state.userDataSource, trab: state.trab);
  }

  Future<TrabModel?> getTrab() async {
    try {
      TrabModel? userInfo = await state.userDataSource.getTrab();
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
      TrabModel? userInfo = await state.userDataSource.postTrab(data: data);
      state.trab = userInfo;
      setState();
      return userInfo;
    } catch (error) {
      print(error);
    }
    return null;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/plogging/data/dataSource/plogging_data_source.dart';
import 'package:trab_front/feature/plogging/data/model/plogging_model.dart';

import 'package:trab_front/feature/trab/data/model/trab_model.dart';

part 'plogging_domain.g.dart';

class PloggingState {
  PloggingDataSource ploggingDataSource;
  PloggingModel? plogging;
  PloggingState({required this.ploggingDataSource});
}

@riverpod
class PloggingController extends _$PloggingController {
  @override
  PloggingState build() {
    return PloggingState(
      ploggingDataSource:
          PloggingDataSource(apiService: ref.watch(apiServiceProvider)),
    );
  }

  Future<TrabModel?> getPloggingList() async {
    try {
      print("여기");
      await state.ploggingDataSource.getPloggingList();
      // state.trab = userInfo;
      // setState();
      // return userInfo;
    } catch (error) {
      print(error);
    }
    return null;
  }
}

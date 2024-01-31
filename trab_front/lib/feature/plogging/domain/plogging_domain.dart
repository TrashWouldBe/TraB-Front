import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/feature/all_providers.dart';
import 'package:trab_front/feature/plogging/data/dataSource/plogging_data_source.dart';
import 'package:trab_front/feature/plogging/data/model/plogging_model.dart';
import 'package:trab_front/feature/plogging/presentation/types.dart';
part 'plogging_domain.g.dart';

class PloggingState {
  PloggingDataSource ploggingDataSource;
  List<PloggingModel> ploggingList;
  PloggingState({required this.ploggingDataSource, required this.ploggingList});
}

@riverpod
class PloggingController extends _$PloggingController {
  @override
  PloggingState build() {
    return PloggingState(
      ploggingDataSource:
          PloggingDataSource(apiService: ref.watch(apiServiceProvider)),
      ploggingList: [],
    );
  }

  void setState() {
    state = PloggingState(
      ploggingDataSource: state.ploggingDataSource,
      ploggingList: state.ploggingList,
    );
  }

  Future<void> getPloggingList() async {
    try {
      state.ploggingList = await state.ploggingDataSource.getPloggingList();
      setState();
    } catch (error) {
      print(error);
    }
  }

  Future<void> postPlogging({required PloggingInfo ploggingInfo}) async {
    try {
      FormData data = await ploggingInfo.toFormData();
      await state.ploggingDataSource.postPlogging(data: data);
    } catch (error) {
      print(error);
    }
  }
}

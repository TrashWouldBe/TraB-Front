// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trab_front/helpers/typedefs.dart';

part 'trab_trash_list_model.freezed.dart';
part 'trab_trash_list_model.g.dart';

@freezed
class TrabTrashListModel with _$TrabTrashListModel {
  const factory TrabTrashListModel({
    required int funitureId,
    required String name,
    required bool isArrange,
    required bool isGet,
  }) = _TrabTrashListModel;

  factory TrabTrashListModel.fromJson(JSON json) =>
      _$TrabTrashListModelFromJson(json);

  static List<TrabTrashListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TrabTrashListModel.fromJson(json as JSON))
        .toList();
  }
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';

enum InfoType { end, timer, stop }

@freezed
class PloggingInfo with _$PloggingInfo {
  const factory PloggingInfo({
    required String runDate,
    required String runName,
    required double runRange,
    required String runTime,
    required int calorie,
    required List<File> images,
  }) = _PloggingInfo;
}

extension PloggingInfoExtension on PloggingInfo {
  Future<FormData> toFormData() async {
    Map<String, dynamic> formDataMap = {
      "runDate": runDate,
      "runName": runName,
      "runRange": runRange,
      "runTime": runTime,
      "calorie": calorie, // 칼로리도 추가
    };

    for (var i = 0; i < images.length; i++) {
      var imageFile = await MultipartFile.fromFile(images[i].path,
          filename: "image_${i}.png");
      formDataMap["images[$i]"] = imageFile;
    }

    return FormData.fromMap(formDataMap);
  }
}

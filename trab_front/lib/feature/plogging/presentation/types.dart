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
    List<MultipartFile> imageFiles = [];
    for (var i = 0; i < images.length; i++) {
      imageFiles.add(
        await MultipartFile.fromFile(images[i].path,
            filename: "image_${i}.png"),
      );
    }
    Map<String, dynamic> formDataMap = {
      "runDate": runDate,
      "runName": runName,
      "runRange": runRange,
      "runTime": runTime,
      "images": imageFiles,
    };

    FormData formData = FormData.fromMap(formDataMap);

    return formData;
  }
}

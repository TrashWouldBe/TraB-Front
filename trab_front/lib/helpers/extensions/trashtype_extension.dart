import 'package:trab_front/helpers/enums/trash_type.dart';

extension TrashTypeExtension on TrashType {
  static TrashType fromString(String string) {
    return TrashType.values.firstWhere(
      (type) => type.name.toLowerCase() == string.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid trash type: $string'),
    );
  }

  String toJson() => name;
  String toKorean() {
    switch (this) {
      case TrashType.glass:
        return '유리';
      case TrashType.paper:
        return '종이';
      case TrashType.metal:
        return '캔';
      case TrashType.plastic:
        return '플라스틱';
      case TrashType.vinyl:
        return '비닐';
      case TrashType.styrofoam:
        return '스티로폼';
      case TrashType.general:
        return '일반';
      case TrashType.food:
        return '음식물';
      default:
        return '알 수 없음';
    }
  }
}

enum TrashType {
  glass,
  paper,
  can,
  plastic,
  vinyl,
  styrofoam,
  general_waste,
  food_waste,
}

extension TrashTypeExtension on TrashType {
  static TrashType fromString(String string) {
    return TrashType.values.firstWhere(
      (type) => type.name.toLowerCase() == string.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid trash type: $string'),
    );
  }

  String toJson() => name;
}

extension WasteTypeExtension on TrashType {
  String toKorean() {
    switch (this) {
      case TrashType.glass:
        return '유리';
      case TrashType.paper:
        return '종이';
      case TrashType.can:
        return '캔';
      case TrashType.plastic:
        return '플라스틱';
      case TrashType.vinyl:
        return '비닐';
      case TrashType.styrofoam:
        return '스티로폼';
      case TrashType.general_waste:
        return '일반';
      case TrashType.food_waste:
        return '음식물';
      default:
        return '알 수 없음';
    }
  }
}

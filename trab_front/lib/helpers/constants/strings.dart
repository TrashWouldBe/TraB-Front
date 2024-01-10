import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class AppStrings {
  const AppStrings._();
  static String floggingTitle(index) {
    return index == 1 ? "지속가능한 걸음을 위한 준비물" : "지속가능한 걸음을 위한 Tip!";
  }

  static String floggingBody(index) {
    return index == 1
        ? "장갑과 봉투, 집게를 준비하면 더욱\n편리하게 플로깅 할 수 있어요!"
        : "분리수거용 봉지와 일반 쓰레기용\n봉지 두 개를 준비하면 더욱 좋아요!";
  }

  static String kiloMeter = "km";

  static String trabSnack = "트래비 간식";

  static String calorie = "칼로리";

  static String time = "시간";
}

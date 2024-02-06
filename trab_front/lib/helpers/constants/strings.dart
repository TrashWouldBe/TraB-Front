import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class AppStrings {
  const AppStrings._();
  static String ploggingTitle(index) {
    return index == 1 ? "지속가능한 걸음을 위한 준비물" : "지속가능한 걸음을 위한 Tip!";
  }

  static String ploggingBody(index) {
    return index == 1
        ? "장갑과 봉투, 집게를 준비하면 더욱\n편리하게 플로깅 할 수 있어요!"
        : "분리수거용 봉지와 일반 쓰레기용\n봉지 두 개를 준비하면 더욱 좋아요!";
  }

  static String googleSignInError = "구글 로그인에 실패했습니다.";

  static String appleSignInError = "애플 로그인에 실패했습니다.";

  static String empty = "";

  static String name = "이름";

  static String weight = "몸무게";

  static String startPlogging = "플로깅 시작";

  static String noWeightPlogging = "칼로리 계산 안하고 플로깅 할래요.";

  static String reasonOfCheckWeight = "*몸무게는 정확한 칼로리계산을 위해 사용됩니다.";

  static String trab = "Trab";

  static String kiloMeter = "km";

  static String examplePlogging = "마장동 트래비 간식사냥";

  static String trabSnack = "트래비 간식";

  static String snack = "간식";

  static String calorie = "칼로리";

  static String time = "시간";

  static String no = "아니요";

  static String arrange = "배치하기";

  static String cameraExpain = "내가 주운 쓰레기를 촬영해\n분리배출 방법을 알아볼까요?";

  static String seeMyTrabSnacks = "내가 주운 트래비 간식 보러가기";

  static String myTrabSnacks = "내가 주운 트래비 간식";

  static String ploggingRecord = "플로깅 기록";

  static String myTrab = "마이 트래비";

  static String myPage = "마이 페이지";

  static String customerCenter = "고객 센터";

  static String method = "이용방법";

  static String invidualQuery = "1:1 문의";

  static String termsOfUse = "이용약관";

  static String logIn = "로그인";

  static String logOut = "로그아웃";

  static String withdrawal = "회원탈퇴";

  static String goToSnackPhoto = "간식 촬영하러 가기";

  static String sortTrash = "간식 분류하기";

  static String plastic = "플라스틱";

  static String glass = "유리";

  static String paper = "종이";

  static String can = "캔";

  static String vinyl = "비닐";

  static String styrofoam = "스티로폼";

  static String waste = "일반 쓰레기";

  static String foodWaste = "음식물 쓰레기";

  static String snackToTrab = "트래비에게 간식주러 가기";

  static String withTrabAgainToday = "오늘도 트래비와 함께!";

  static String snackSettlement = "간식 정산하러 가기";

  static String notSaveWhenNotSettle = "간식 정산을 하지 않으면 플로깅 기록이\n저장되지 않아요!";

  static String notDo = "안할래요";

  static String close = "닫기";

  static String cancle = "취소하기";

  static String pleaseSetTrabName = "함께 지속가능한 걸음을 만들어나갈\n나만의 트래비 이름을 지어주세요.";

  static String pleaseInputLeastTwo = "2글자 이상 입력해주세요!";

  static String nameToMe = "저에게 이름이 생겼어요!";

  static String withYouForever = "앞으로의 발걸음마다 제가 함께 할게요!";

  static String start = "START!";

  static String initialTime = "0:00";

  static String owner = "주인";

  static String furnitureT = "가구";

  static String snackT = "간식";

  static String end = "종료하기";

  static String trabHouseT = "의 트래비 하우스";

  static String arrangeFunitureQuery = "가구를 배치하시겠습니까?";

  static String cancelArrangeFunitureQuery = "가구 배치를 취소하시겠습니까?";
}

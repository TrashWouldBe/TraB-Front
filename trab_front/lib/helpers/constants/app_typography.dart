import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: 텍스트 추가하는 스크린 작업할 때 마다 textStyle 추가

@immutable
class AppTypography {
  const AppTypography._();

  static final headline_1 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 128.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final headline_1_2 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 48.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final headline_2 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 96.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final headline_2_1 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final caption = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final title = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final body = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final body_3 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final mainCaption_1 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final mainCaption_2 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    decoration: TextDecoration.none,
  );

  static final subTitle_1 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    decoration: TextDecoration.none,
  );
}

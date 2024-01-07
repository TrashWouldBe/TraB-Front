import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: 텍스트 추가하는 스크린 작업할 때 마다 textStyle 추가

@immutable
class AppTypography {
  const AppTypography._();
  static final captions = _FontStyle(
    fontFamily: "Pretendard",
    caption: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    // caption:
  );
}

@immutable
class _FontStyle {
  final String? fontFamily;
  // final TextStyle mainSubtitle;
  // final TextStyle headline1;
  // final TextStyle headline2;
  // final TextStyle headline1_2;
  // final TextStyle headline2_1;
  // final TextStyle headline3;
  // final TextStyle subtitle1;
  // final TextStyle subtitle2;
  // final TextStyle body;
  // final TextStyle body2;
  // final TextStyle body3;
  // final TextStyle body4;
  // final TextStyle body5;
  final TextStyle caption;
  // final TextStyle caption2;
  // final TextStyle captionTitle;

  const _FontStyle({
    this.fontFamily,
    // required this.mainSubtitle,
    // required this.headline1,
    // required this.headline2,
    // required this.headline1_2,
    // required this.headline2_1,
    // required this.headline3,
    // required this.subtitle1,
    // required this.subtitle2,
    // required this.body,
    // required this.body2,
    // required this.body3,
    // required this.body4,
    // required this.body5,
    required this.caption,
    // required this.caption2,
    // required this.captionTitle,
  });
}

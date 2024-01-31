import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_gifs.dart';

Widget trabContainer() {
  return Container(
    width: 283.w,
    height: 382.h,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2.w, color: AppColors.subColor),
        borderRadius: BorderRadius.circular(40.r),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 12,
          offset: Offset(0, 6),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x16000000),
          blurRadius: 22,
          offset: Offset(0, 22),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x0C000000),
          blurRadius: 30,
          offset: Offset(0, 50),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x02000000),
          blurRadius: 36,
          offset: Offset(0, 89),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x00000000),
          blurRadius: 39,
          offset: Offset(0, 139),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Image.asset(
      AppGifs.jumpTrab,
    ),
  );
}

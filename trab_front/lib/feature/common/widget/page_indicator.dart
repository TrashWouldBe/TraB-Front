import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';

Widget pageIndicator({required int selectedPage, required int itemCount}) {
  return SizedBox(
    height: 10.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        if (index == selectedPage) {
          return pageCircle(color: AppColors.accentColor);
        } else {
          return pageCircle(color: AppColors.greenGrey2);
        }
      },
    ),
  );
}

Widget pageCircle({required Color color}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w),
    child: Container(
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}

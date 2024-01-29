import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';

Widget furnitureItem(
    {required String svg,
    required VoidCallback onTap,
    required bool activate}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(
      children: [
        Container(
          width: 110.w,
          height: 126.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    blurRadius: 6.0,
                    color: const Color(0xFF000000).withOpacity(0.09))
              ]),
          child: SvgPicture.asset(
            svg,
            width: 110.w,
            height: 126.h,
          ),
        ),
        !activate
            ? Container(
                width: 110.w,
                height: 126.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      // BoxShadow(
                      //   offset: const Offset(0, 1),
                      //   blurRadius: 3.0,
                      //   color: const Color(0xFF000000).withOpacity(0.1)
                      // ),
                      BoxShadow(
                          offset: const Offset(0, 6),
                          blurRadius: 6.0,
                          color: const Color(0xFF000000).withOpacity(0.09))
                    ]),
                child: SvgPicture.asset(
                  AppSvgs.locked,
                  width: 110.w,
                  height: 126.h,
                ),
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
}

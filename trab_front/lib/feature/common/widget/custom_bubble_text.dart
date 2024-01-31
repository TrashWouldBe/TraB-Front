import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

/*
  dir: top, bottom
*/
Widget customBubbleText({
  required String trabSay,
  required onTap,
  String dir = "bottom",
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: SizedBox(
      width: 390.w,
      child: Row(
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (dir == "top")
                Padding(
                  padding: EdgeInsets.only(
                    left: 40.w,
                  ),
                  child: CustomPaint(
                    size: Size(30.14.w, 12.24.h),
                    painter: TrianglePainter(),
                  ),
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
                alignment: Alignment.center,
                height: 41.66.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.accentColor),
                child: AnimatedTextKit(
                  key: ValueKey(trabSay),
                  onTap: onTap,
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      trabSay,
                      textStyle:
                          AppTypography.body_5.copyWith(color: AppColors.body1),
                    )
                  ],
                ),
              ),
              if (dir == "bottom")
                Padding(
                  padding: EdgeInsets.only(left: 150.w),
                  child: CustomPaint(
                    size: Size(22.w, 10.h),
                    painter: SlantedTrianglePainter(),
                  ),
                ),
            ],
          ),
          const Spacer()
        ],
      ),
    ),
  );
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accentColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class SlantedTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accentColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height)
      ..lineTo(3.w, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

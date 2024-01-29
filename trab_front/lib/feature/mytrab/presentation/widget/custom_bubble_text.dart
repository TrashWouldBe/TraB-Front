import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/mytrab_view_model.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Widget customBubbleText(WidgetRef ref) {
  String trabSay = ref.watch(myTrabScreenControllerProvider).trabSay;

  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: ref.read(myTrabScreenControllerProvider.notifier).getTrabSay,
    child: SizedBox(
      width: 390.w,
      child: Row(
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                ),
                child: CustomPaint(
                  size: Size(30.14.w, 12.24.h),
                  painter: TrianglePainter(),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                alignment: Alignment.center,
                height: 41.66.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.accentColor),
                child: AnimatedTextKit(
                  key: ValueKey(trabSay),
                  onTap: ref
                      .read(myTrabScreenControllerProvider.notifier)
                      .getTrabSay,
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
              )
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

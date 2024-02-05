import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/noti_happy.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class NotiArrangeFurniture extends StatelessWidget {
  const NotiArrangeFurniture({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      content: IntrinsicHeight(
        child: Container(
          width: 329.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: AppColors.body1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Text(
                "가구를 배치하시겠습니까?",
                style: AppTypography.mainCaption_1
                    .copyWith(color: AppColors.textColor_2),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "아니요",
                        style: AppTypography.mainCaption_1
                            .copyWith(color: AppColors.grey1),
                      )),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        onTap();
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const NotiHappy();
                            });
                      },
                      child: Text(
                        "배치하기",
                        style: AppTypography.mainCaption_1
                            .copyWith(color: AppColors.accentColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/noti_happy.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

// ignore: must_be_immutable
class NotiArrangeFurniture extends StatelessWidget {
  NotiArrangeFurniture(
      {super.key, required this.onTap, required this.isArrange});
  final Function onTap;
  bool isArrange;

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
                isArrange
                    ? AppStrings.cancelArrangeFunitureQuery
                    : AppStrings.arrangeFunitureQuery,
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
                        AppStrings.no,
                        style: AppTypography.mainCaption_1
                            .copyWith(color: AppColors.grey1),
                      )),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      await onTap();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                      // ignore: use_build_context_synchronously
                      if (!isArrange)
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const NotiHappy();
                          },
                        );
                    },
                    child: Text(
                      isArrange ? AppStrings.cancle : AppStrings.arrange,
                      style: AppTypography.mainCaption_1
                          .copyWith(color: AppColors.accentColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

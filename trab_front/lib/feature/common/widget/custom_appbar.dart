import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.titleColor,
    this.systemOverlayStyle,
    this.bottom,
    this.onPressedLeading,
    this.leadingColor,
    this.canPop,
    this.canPush,
    this.trailingColor,
    this.onPressedTrailing,
  });
  String? title;
  Color? backgroundColor;
  Color? titleColor;
  Color? leadingColor;
  Color? trailingColor;
  SystemUiOverlayStyle? systemOverlayStyle;
  PreferredSizeWidget? bottom;
  void Function()? onPressedLeading;
  void Function()? onPressedTrailing;
  bool? canPop;
  bool? canPush;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.body1,
      toolbarHeight: 50.h,
      systemOverlayStyle: systemOverlayStyle ?? SystemUiOverlayStyle.dark,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: Row(
          children: [
            if (canPop ?? true)
              noPaddingButton(
                child: SvgPicture.asset(
                  AppSvgs.leftArrow,
                  color: leadingColor ?? AppColors.grey1,
                ),
                onPressed: onPressedLeading ?? () => AppRouter.pop(),
              ),
            SizedBox(
              width: 13.w,
            ),
            if (title != null)
              Text(
                title!,
                style: AppTypography.headline_3
                    .copyWith(color: titleColor ?? AppColors.textColor_2),
              ),
            const Spacer(),
            if (canPush ?? false)
              noPaddingButton(
                child: SvgPicture.asset(
                  AppSvgs.rightArraw,
                  color: trailingColor ?? AppColors.grey1,
                ),
                onPressed: onPressedTrailing ?? () => AppRouter.pop(),
              ),
            SizedBox(
              width: 13.w,
            ),
          ],
        ),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(54.h);
}

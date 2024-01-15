import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/feature/common/widget/button.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.titleColor,
    this.systemOverlayStyle,
    this.bottom,
  });
  String title;
  Color? backgroundColor;
  Color? titleColor;
  SystemUiOverlayStyle? systemOverlayStyle;
  PreferredSizeWidget? bottom;
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
            noPaddingButton(
              child: SvgPicture.asset(
                AppSvgs.leftArrow,
                color: AppColors.grey1,
              ),
              onPressed: () => AppRouter.pop(),
            ),
            SizedBox(
              width: 13.w,
            ),
            Text(
              title,
              style: AppTypography.headline_3
                  .copyWith(color: titleColor ?? AppColors.textColor_2),
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

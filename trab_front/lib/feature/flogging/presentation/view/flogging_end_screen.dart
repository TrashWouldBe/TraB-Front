import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/flogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_info_view_model.dart';
import 'package:trab_front/feature/setting/presentation/widget/adaptive_dialog.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/datetime_extension.dart';

class FloggingEndScreen extends ConsumerStatefulWidget {
  const FloggingEndScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FloggingEndScreenState();
  }
}

class _FloggingEndScreenState extends ConsumerState<FloggingEndScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    List<File> _snacks = ref.watch(floggingInfoControllerProvider).trabSnacks;
    String _time = ref.watch(floggingInfoControllerProvider).time;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppColors.subColor,
          appBar: CustomAppBar(
            title: AppStrings.withTrabAgainToday,
            backgroundColor: AppColors.subColor,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            titleColor: AppColors.body1,
            leadingColor: AppColors.body1,
            onPressed: () async {
              await showCustomDialog(
                context: context,
                title: AppStrings.notSaveWhenNotSettle,
                actions: [
                  adaptiveAction(
                    context: context,
                    onPressed: () {
                      Navigator.of(context).pop();
                      ref
                          .read(floggingInfoControllerProvider.notifier)
                          .endTimer();
                      AppRouter.pushAndRemoveUntil(Routes.HomeScreenRoute);
                    },
                    child: Text(
                      AppStrings.notDo,
                      style: AppTypography.mainCaption_1
                          .copyWith(color: AppColors.grey1),
                    ),
                  ),
                  adaptiveAction(
                    context: context,
                    onPressed: Navigator.of(context).pop,
                    child: Text(
                      AppStrings.close,
                      style: AppTypography.mainCaption_1
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              );
            },
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
              decoration: ShapeDecoration(
                color: AppColors.body1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 34.h,
                        ),
                        Text(
                          DateTime.now().getCurrentDateFormatted(),
                          style: AppTypography.subTitle_1
                              .copyWith(color: AppColors.textColor_1),
                        ),
                        TextField(
                          style: AppTypography.body
                              .copyWith(color: AppColors.grey1),
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: SvgPicture.asset(
                                AppSvgs.edit,
                                color: AppColors.grey1,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey1),
                            ),
                            suffixIconConstraints:
                                BoxConstraints(maxWidth: 60.w, maxHeight: 60.h),
                          ),
                        ),
                        SizedBox(
                          height: 105.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "0.00",
                                style: AppTypography.headline_2.copyWith(
                                  color: AppColors.textColor_2,
                                  letterSpacing: -0.41,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                "km",
                                style: AppTypography.headline_2_1
                                    .copyWith(color: AppColors.textColor_2),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  _snacks.length.toString(),
                                  style: AppTypography.body_2
                                      .copyWith(color: AppColors.textColor_2),
                                ),
                                Text(
                                  AppStrings.trabSnack,
                                  style: AppTypography.body_3
                                      .copyWith(color: AppColors.textColor_2),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  _snacks.length.toString(),
                                  style: AppTypography.body_2
                                      .copyWith(color: AppColors.textColor_2),
                                ),
                                Text(
                                  AppStrings.trabSnack,
                                  style: AppTypography.body_3
                                      .copyWith(color: AppColors.textColor_2),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  _snacks.length.toString(),
                                  style: AppTypography.body_2
                                      .copyWith(color: AppColors.textColor_2),
                                ),
                                Text(
                                  AppStrings.trabSnack,
                                  style: AppTypography.body_3
                                      .copyWith(color: AppColors.textColor_2),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 300.h, child: const MapScreen()),
                  SizedBox(
                    height: 28.h,
                  ),
                  containerButton(
                    title: AppStrings.snackSettlement,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

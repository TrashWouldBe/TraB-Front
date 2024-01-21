import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/flogging/presentation/types.dart';
import 'package:trab_front/feature/flogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_end_view_model.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_info_view_model.dart';
import 'package:trab_front/feature/flogging/presentation/widget/flogging_end_text_field.dart';
import 'package:trab_front/feature/flogging/presentation/widget/flogging_infos.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/strings.dart';

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
    double _distance = ref.watch(floggingInfoControllerProvider).distance;
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
            onPressed: () {
              ref
                  .read(floggingEndScreenControllerProvider.notifier)
                  .handlePressedAppBarButton(context: context);
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
                        floggingEndTextField(),
                        floggingEndInfo(
                            snack: _snacks.length.toString(),
                            calorie: "0",
                            time: _time,
                            distance: _distance.toStringAsFixed(2),
                            type: InfoType.end),
                      ],
                    ),
                  ),
                  SizedBox(height: 300.h, child: const MapScreen()),
                  SizedBox(
                    height: 28.h,
                  ),
                  containerButton(
                    title: AppStrings.snackSettlement,
                    onPressed: ref
                        .read(floggingEndScreenControllerProvider.notifier)
                        .handleCalculateSnackButton,
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

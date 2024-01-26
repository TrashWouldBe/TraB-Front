import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/plogging/presentation/types.dart';
import 'package:trab_front/feature/plogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_end_view_model.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_info_view_model.dart';
import 'package:trab_front/feature/plogging/presentation/widget/plogging_end_text_field.dart';
import 'package:trab_front/feature/plogging/presentation/widget/plogging_infos.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class PloggingEndScreen extends ConsumerStatefulWidget {
  const PloggingEndScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingEndScreenState();
  }
}

class _PloggingEndScreenState extends ConsumerState<PloggingEndScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    List<File> _snacks = ref.watch(ploggingInfoControllerProvider).trabSnacks;
    String _time = ref.watch(ploggingInfoControllerProvider).time;
    double _distance = ref.watch(ploggingInfoControllerProvider).distance;
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
            onPressedLeading: () {
              ref
                  .read(ploggingEndScreenControllerProvider.notifier)
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
                        ploggingEndTextField(),
                        ploggingEndInfo(
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
                        .read(ploggingEndScreenControllerProvider.notifier)
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

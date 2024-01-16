import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/camera/presentation/viewmodel/camera_screen_view_model.dart';
import 'package:trab_front/feature/camera/presentation/widget/sorted_trash_image.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class EattingSnackTrabScreen extends ConsumerStatefulWidget {
  const EattingSnackTrabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _EattingSnackTrabScreenState();
  }
}

class _EattingSnackTrabScreenState
    extends ConsumerState<EattingSnackTrabScreen> {
  @override
  Widget build(BuildContext context) {
    File image = ref.watch(cameraScreenControllerProvider).image!;
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.empty,
        onPressed: () => AppRouter.popUntil(Routes.HomeScreenRoute),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              sortedTrashImage(image: image, text: AppStrings.plastic),
              SizedBox(
                height: 32.h,
              ),
              Image.asset("assets/images/seperation_and_discharge_1.png"),
              SizedBox(
                height: 35.h,
              ),
              containerButton(title: AppStrings.snackToTrab)
            ],
          ),
        ),
      ),
    );
  }
}

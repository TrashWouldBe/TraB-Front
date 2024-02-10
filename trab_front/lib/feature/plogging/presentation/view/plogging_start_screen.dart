import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/feature/common/widget/page_indicator.dart';
import 'package:trab_front/feature/plogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_start_screen_view_model.dart';
import 'package:trab_front/feature/plogging/presentation/widget/plogging_tips.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class PloggingStartScreen extends ConsumerStatefulWidget {
  const PloggingStartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingStartScreenState();
  }
}

class _PloggingStartScreenState extends ConsumerState<PloggingStartScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedPage =
        ref.watch(ploggingStartScreenControllerProvider).selectedPage;
    MapScreen mapScreen = ref.read(mapScreenProvider);
    return SafeArea(
      top: Platform.isAndroid ? true : false,
      child: Stack(
        children: [
          mapScreen,
          Positioned(
            top: -350.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 111.h,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ploggingExplainContiner(
                      title: AppStrings.ploggingTitle(index),
                      body: AppStrings.ploggingBody(index),
                    );
                  },
                  onPageChanged: ref
                      .read(ploggingStartScreenControllerProvider.notifier)
                      .onPageChanged,
                ),
              ),
            ),
          ),
          Positioned(
            top: -200.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: pageIndicator(selectedPage: selectedPage, itemCount: 3),
            ),
          ),
          Positioned(
            top: 400.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
                alignment: Alignment.center,
                child: noPaddingButton(
                  onPressed: ref
                      .read(ploggingStartScreenControllerProvider.notifier)
                      .handleTapStartButton,
                  child: Container(
                    width: 126.w,
                    height: 126.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accentColor,
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.start,
                        style: AppTypography.title
                            .copyWith(color: AppColors.body1),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

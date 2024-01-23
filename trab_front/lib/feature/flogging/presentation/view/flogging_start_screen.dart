import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/feature/flogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_start_screen_view_model.dart';
import 'package:trab_front/feature/flogging/presentation/widget/flogging_tips.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class FloggingStartScreen extends ConsumerStatefulWidget {
  const FloggingStartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FloggingStartScreenState();
  }
}

class _FloggingStartScreenState extends ConsumerState<FloggingStartScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedPage =
        ref.watch(floggingStartScreenControllerProvider).selectedPage;
    return SafeArea(
      top: Platform.isAndroid ? true : false,
      child: Stack(
        children: [
          const MapScreen(),
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
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return floggingExplainContiner(
                      title: AppStrings.floggingTitle(index),
                      body: AppStrings.floggingBody(index),
                    );
                  },
                  onPageChanged: ref
                      .read(floggingStartScreenControllerProvider.notifier)
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == _selectedPage) {
                      return floggingExplainIndicator(
                          color: AppColors.accentColor);
                    } else {
                      return floggingExplainIndicator(color: AppColors.body1);
                    }
                  },
                )),
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
                      .read(floggingStartScreenControllerProvider.notifier)
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

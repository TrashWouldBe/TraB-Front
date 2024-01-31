import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';

import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/common/widget/custom_bubble_text.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/mytrab_view_model.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_gifs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(myTrabScreenControllerProvider.notifier).getTrabEattingSay();
    });
  }

  @override
  Widget build(BuildContext context) {
    String trabSay = ref.watch(myTrabScreenControllerProvider).trabSay;
    return PopScope(
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.empty,
          onPressedLeading: () => AppRouter.popUntil(Routes.HomeScreenRoute),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90.h,
              ),
              GestureDetector(
                onTap: ref
                    .read(myTrabScreenControllerProvider.notifier)
                    .getTrabEattingSay,
                child: Stack(
                  children: [
                    customBubbleText(
                      trabSay: trabSay,
                      onTap: ref
                          .read(myTrabScreenControllerProvider.notifier)
                          .getTrabEattingSay,
                    ),
                    Image.asset(AppGifs.eatTrab),
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tip!",
                      style: AppTypography.caption_title
                          .copyWith(color: AppColors.captionTitle),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      '정확한 쓰레기 분리배출 방법을 안다는 것은 트래비를 지키는 지름길이 될 수 있어요!',
                      style: AppTypography.caption_2.copyWith(
                        color: AppColors.captionTitle,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

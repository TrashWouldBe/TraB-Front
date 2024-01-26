import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/feature/common/widget/no_padding_button.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_info_view_model.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class PloggingCalculateScreen extends ConsumerStatefulWidget {
  const PloggingCalculateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingCalculateScreenState();
  }
}

class _PloggingCalculateScreenState
    extends ConsumerState<PloggingCalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            children: [
              SizedBox(
                height: 530.h,
              ),
              containerButton(title: "내가 주운 트래비 간식 보러가기"),
              SizedBox(
                height: 20.h,
              ),
              noPaddingButton(
                child: Text(
                  "종료하기",
                  style: AppTypography.body.copyWith(color: AppColors.grey1),
                ),
                onPressed: () {
                  ref.read(ploggingInfoControllerProvider.notifier).endTimer();
                  AppRouter.pushAndRemoveUntil(Routes.HomeScreenRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

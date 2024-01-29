import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_count_down_screen_view_model.dart';

import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class PloggingCountDownScreen extends ConsumerStatefulWidget {
  const PloggingCountDownScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingCountDownScreenState();
  }
}

class _PloggingCountDownScreenState
    extends ConsumerState<PloggingCountDownScreen> {
  @override
  void initState() {
    super.initState();
    ref
        .read(ploggingCountDownScreenControllerProvider.notifier)
        .startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    int count = ref.watch(ploggingCountDownScreenControllerProvider).count;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Text(
            count.toString(),
            style: AppTypography.headline_1
                .copyWith(color: AppColors.backgroundColor),
          ),
        ),
      ),
    );
  }
}

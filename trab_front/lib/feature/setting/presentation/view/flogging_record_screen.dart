import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/setting/presentation/widget/flogging_record_container.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';

class FloggingRecordScreen extends ConsumerStatefulWidget {
  const FloggingRecordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FloggingRecordScreenState();
  }
}

class _FloggingRecordScreenState extends ConsumerState<FloggingRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "플로깅 기록",
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.h),
          child: Container(
            height: 1.h,
            color: AppColors.greenGrey3,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [floggingRecordContainer()],
        ),
      ),
    );
  }
}

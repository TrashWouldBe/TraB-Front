import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/plogging/data/model/plogging_model.dart';
import 'package:trab_front/feature/plogging/domain/plogging_domain.dart';
import 'package:trab_front/feature/setting/presentation/widget/plogging_record_container.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class PloggingRecordScreen extends ConsumerStatefulWidget {
  const PloggingRecordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingRecordScreenState();
  }
}

class _PloggingRecordScreenState extends ConsumerState<PloggingRecordScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(ploggingControllerProvider.notifier).getPloggingList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PloggingModel> ploggingList =
        ref.watch(ploggingControllerProvider).ploggingList;
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.ploggingRecord,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.h),
          child: Container(
            height: 1.h,
            color: AppColors.greenGrey3,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: ploggingList.length,
          itemBuilder: (context, index) {
            return ploggingRecordContainer(plogging: ploggingList[index]);
          },
        ),
      ),
    );
  }
}

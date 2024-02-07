import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/feature/mytrab/domain/trab_domain.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/mytrab_snack_screen_view_model.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/classified_photo_widget.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/total_count_container.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/trab_snack_info_container.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class MyTrabSnackScreen extends ConsumerStatefulWidget {
  const MyTrabSnackScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyTrabSnackScreen();
  }
}

class _MyTrabSnackScreen extends ConsumerState<MyTrabSnackScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(myTrabSnackScreenControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ImageModel> trabTotalTrashList =
        ref.watch(trabControllerProvider).trabTotalTrashList;
    TrabSnackModel? trabSnackTotalModel =
        ref.watch(trabControllerProvider).trabTotalSnack;
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.myTrabSnacks,
        titleColor: AppColors.textColor_1,
        canPop: true,
        leadingColor: AppColors.grey1,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.h),
          child: Container(
            height: 1.h,
            color: AppColors.greenGrey2,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            totalCountContainer(
                totalCount: trabTotalTrashList.length,
                backgroundColor: AppColors.accentColor,
                type: "total",
                textColor: AppColors.body1),
            Text(
              "Tip! 내가 직접 주운 트래비 간식들을 올바르게 분리배출해서 트래비와 지속가능한 걸음을 만들어나가요!",
              style: AppTypography.iconTxt.copyWith(
                  color: AppColors.grey2, fontWeight: FontWeight.w600),
            ),
            trabSnackInfoContainer(
              trabSnackModel: trabSnackTotalModel,
            ),
            Container(
              height: 1.h,
              color: AppColors.greenGrey2,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: trabTotalTrashList.length,
                itemBuilder: (context, index) {
                  return classifiedPhotoWidget(
                      index: index,
                      item: trabTotalTrashList[index].trashEnumType,
                      img: trabTotalTrashList[index].imageUrl);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

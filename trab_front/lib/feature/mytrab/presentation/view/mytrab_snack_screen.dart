import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/mytrab/domain/trab_domain.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/classified_photo_widget.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/total_count_container.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/trab_snack_info_container.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/enums/trash_type.dart';

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
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(trabControllerProvider.notifier).getTrabSnackTrashList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                totalCount: 0,
                backgroundColor: AppColors.accentColor,
                textColor: AppColors.body1),
            Text(
              "Tip! 내가 직접 주운 트래비 간식들을 올바르게 분리배출해서 트래비와 지속가능한 걸음을 만들어나가요!",
              style: AppTypography.iconTxt.copyWith(
                  color: AppColors.grey2, fontWeight: FontWeight.w600),
            ),
            trabSnackInfoContainer(
              plasticAmount: 0,
              vinylAmount: 0,
              canAmount: 0,
              wasteAmount: 0,
              styrofoamAmount: 0,
              glassAmount: 0,
              foodAmount: 0,
              paperAmount: 0,
            ),
            Container(
              height: 1.h,
              color: AppColors.greenGrey2,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return classifiedPhotoWidget(
                      index: index,
                      item: TrashType.styrofoam,
                      img: AppImages.appleLogin);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

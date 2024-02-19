import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/classified_photo_widget.dart';
import 'package:trab_front/feature/plogging/domain/plogging_domain.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/datetime_extension.dart';

class PloggingMyTrabSnackScreen extends ConsumerStatefulWidget {
  const PloggingMyTrabSnackScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingMyTrabSnackScreenState();
  }
}

class _PloggingMyTrabSnackScreenState
    extends ConsumerState<PloggingMyTrabSnackScreen> {
  @override
  Widget build(BuildContext context) {
    List<ImageModel> ploggingSnacks =
        ref.watch(ploggingControllerProvider).ploggingSnacks;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppBar(
          canPop: true,
          onPressedLeading: () => AppRouter.popUntil(Routes.HomeScreenRoute),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                DateTime.now().getCurrentDateFormatted(),
                style:
                    AppTypography.subTitle_2.copyWith(color: AppColors.grey2),
              ),
              Text(
                AppStrings.myTrabSnacks,
                style: AppTypography.headline_3
                    .copyWith(color: AppColors.textColor_1),
              ),
              SizedBox(
                height: 34.h,
              ),
              Container(
                width: 322.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Center(
                  child: Text(
                    "직접 주운 간식이 이렇게 분류되었어요!",
                    style: AppTypography.mainCaption_1
                        .copyWith(color: AppColors.backgroundColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Tip! 정확한 쓰레기 분리배출 방법을 안다는 것은 트래비를 지키는 첫번째 방법이 될 수 있어요.",
                style: AppTypography.caption_3.copyWith(color: AppColors.grey2),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  width: double.infinity,
                  height: 1.h,
                  color: AppColors.greenGrey2),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ploggingSnacks.length,
                  itemBuilder: (context, index) {
                    return classifiedPhotoWidget(
                      item: ploggingSnacks[index].trashEnumType,
                      img: ploggingSnacks[index].imageUrl,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

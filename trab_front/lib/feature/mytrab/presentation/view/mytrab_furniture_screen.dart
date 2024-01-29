import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/furniture_item.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/noti_arrange_furn.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/noti_want_to_purchase.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/total_count_container.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/trab_furn_info_container.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

class MyTrabFurnitureScreen extends ConsumerStatefulWidget {
  const MyTrabFurnitureScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyTrabFurnitureScreen();
  }
}

class _MyTrabFurnitureScreen extends ConsumerState<MyTrabFurnitureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.subColor,
      appBar: CustomAppBar(
        title: "가구 둘러보기",
        titleColor: AppColors.body1,
        backgroundColor: AppColors.subColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            color: AppColors.backgroundColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                totalCountContainer(
                    totalCount: 0,
                    backgroundColor: AppColors.body1,
                    textColor: AppColors.textColor_2),
                Text(
                  "내가 주운 간식으로 트래비에게 가구를 선물해 줄 수 있어요!",
                  style: AppTypography.semibold
                      .copyWith(color: AppColors.backgroundColor),
                ),
                trabFurnInfoContainer(
                    plasticAmount: 0,
                    vinylAmount: 0,
                    canAmount: 0,
                    wasteAmount: 0,
                    styrofoamAmount: 0,
                    glassAmount: 0,
                    foodAmount: 0,
                    paperAmount: 0)
              ],
            ),
          ),
          Divider(color: AppColors.greenGrey2, thickness: 2.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: GridView(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    childAspectRatio: (0.78 / 1)),
                children: [
                  furnitureItem(
                      svg: AppSvgs.familyPictureBtn,
                      activate: true,
                      onTap: () {
                        if ("true" == "true") {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return NotiArrangeFurniture(onTap: () {});
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return NotiWantToPurchase(
                                  svg: AppSvgs.notiFamilyPicture,
                                  onTap: () {},
                                );
                              });
                        }
                      }),
                  furnitureItem(
                      svg: AppSvgs.groundBtn,
                      activate: false,
                      onTap: () {
                        if ("locked" == "true") {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return NotiArrangeFurniture(onTap: () {});
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return NotiWantToPurchase(
                                  svg: AppSvgs.notiGround,
                                  onTap: () {},
                                );
                              });
                        }
                      }),
                  furnitureItem(
                      svg: AppSvgs.lightBtn, activate: false, onTap: () {}),
                  furnitureItem(
                      svg: AppSvgs.luckyPotBtn, activate: false, onTap: () {}),
                  furnitureItem(
                      svg: AppSvgs.lugBtn, activate: false, onTap: () {}),
                  furnitureItem(
                      svg: AppSvgs.tableBtn, activate: false, onTap: () {}),
                  furnitureItem(
                      svg: AppSvgs.trashcanBtn, activate: false, onTap: () {}),
                  furnitureItem(
                      svg: AppSvgs.wallpaperBtn, activate: false, onTap: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_furniture_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/feature/mytrab/domain/trab_domain.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/mytrab_furniture_view_model.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/furniture_item.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/noti_arrange_furn.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/noti_want_to_purchase.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/total_count_container.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/trab_furn_info_container.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/enums/furniture_type.dart';

class MyTrabFurnitureScreen extends ConsumerStatefulWidget {
  const MyTrabFurnitureScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyTrabFurnitureScreen();
  }
}

class _MyTrabFurnitureScreen extends ConsumerState<MyTrabFurnitureScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(myTrabFurnitureScreenControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    TrabSnackModel? trabSnackModel =
        ref.watch(trabControllerProvider).trabSnack;
    List<TrabFurnitureModel>? trabFurnitureModel =
        ref.watch(trabControllerProvider).trabFurniture;
    return Scaffold(
      backgroundColor: AppColors.subColor,
      appBar: CustomAppBar(
        title: "가구 둘러보기",
        titleColor: AppColors.body1,
        leadingColor: AppColors.body1,
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
                    type: "snack",
                    totalCount: trabSnackModel?.getTotalWasteCount() ?? 0,
                    backgroundColor: AppColors.body1,
                    textColor: AppColors.textColor_2),
                Text(
                  "내가 주운 간식으로 트래비에게 가구를 선물해 줄 수 있어요!",
                  style: AppTypography.semibold
                      .copyWith(color: AppColors.backgroundColor),
                ),
                trabFurnInfoContainer(
                  trabSnackModel: trabSnackModel,
                )
              ],
            ),
          ),
          Divider(color: AppColors.greenGrey2, thickness: 2.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  childAspectRatio: (0.78 / 1),
                ),
                itemCount: trabFurnitureModel.length,
                itemBuilder: (context, index) {
                  return furnitureItem(
                    svg: trabFurnitureModel[index].furnitureEnumType.buttonSvg,
                    activate: trabFurnitureModel[index].isGet,
                    onTap: () {
                      if (ref
                              .read(myTrabFurnitureScreenControllerProvider
                                  .notifier)
                              .canPurchaseOrArrange(
                                  trabFurnitureModel[index].furnitureEnumType,
                                  trabSnackModel) &&
                          trabFurnitureModel[index].isGet) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return NotiArrangeFurniture(
                              onTap: () => ref
                                  .read(myTrabFurnitureScreenControllerProvider
                                      .notifier)
                                  .handleTapArrangeButton(
                                    trabFurnitureModel:
                                        trabFurnitureModel[index],
                                  ),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return NotiWantToPurchase(
                              svg: trabFurnitureModel[index]
                                  .furnitureEnumType
                                  .notiSvg,
                              onTap: () => ref
                                  .read(myTrabFurnitureScreenControllerProvider
                                      .notifier)
                                  .handleTapPurchaseButton(
                                    trabFurnitureModel:
                                        trabFurnitureModel[index],
                                  ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

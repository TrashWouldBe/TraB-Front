import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gif/gif.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_furniture_model.dart';
import 'package:trab_front/feature/mytrab/domain/trab_domain.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/mytrab_view_model.dart';
import 'package:trab_front/feature/common/widget/custom_bubble_text.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/house_name_widget.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/iconbtn.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_gifs.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/extensions/furnituretype_extension.dart';

class MyTrabScreen extends ConsumerStatefulWidget {
  const MyTrabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyTrabScreen();
  }
}

class _MyTrabScreen extends ConsumerState<MyTrabScreen>
    with TickerProviderStateMixin {
  late final GifController gifController;
  @override
  void initState() {
    super.initState();
    gifController = GifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(myTrabScreenControllerProvider.notifier).init();
    });
  }

  @override
  void dispose() {
    ref.read(myTrabScreenControllerProvider.notifier).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String trabSay = ref.watch(myTrabScreenControllerProvider).trabSay;
    TextEditingController textEditingController =
        ref.watch(myTrabScreenControllerProvider).textEditingController;
    List<TrabFurnitureModel> trabFurnitureModel =
        ref.watch(trabControllerProvider).trabFurniture;
    List<TrabFurnitureModel> arrangedFurniture =
        trabFurnitureModel.where((item) => item.isArrange).toList();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: AppColors.lightPrimaryColor,
        child: Stack(
          children: [
            //background
            Positioned(
              top: 0.h,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                AppSvgs.myTrabHomeBg,
                width: 390.w,
              ),
            ),
            //background_for_flip
            Positioned(
              bottom: 0.h,
              child: Container(
                width: 390.w,
                height: 209.h,
                color: AppColors.bgColor_4,
              ),
            ),

            ...arrangedFurniture.map(
              (item) {
                return Positioned(
                    left: item.furnitureEnumType.position.left ?? 0,
                    top: item.furnitureEnumType.position.top ?? 0,
                    bottom: item.furnitureEnumType.position.bottom ?? 0,
                    right: item.furnitureEnumType.position.right ?? 0,
                    child: item.furnitureEnumType.furnitureImage);
              },
            ),

            Positioned(
              top: 100.h,
              left: 0,
              right: 0,
              bottom: -350.h,
              child: SizedBox(
                height: 221.h,
                width: 148.w,
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    ref
                        .read(myTrabScreenControllerProvider.notifier)
                        .handleTabTrab(gifController: gifController);
                  },
                  child: Gif(
                    controller: gifController,
                    width: 148.w,
                    height: 221.h,
                    image: AssetImage(AppGifs.smileTrab_1),
                  ),
                ),
              ),
            ),
            //버블 텍스트
            Positioned(
              top: 630.h,
              child: customBubbleText(
                dir: "top",
                trabSay: trabSay,
              ),
            ),
            //icons
            Positioned(
              top: 60.h,
              left: 26.h,
              child: myTrabIconBtn(
                  onTap: ref
                      .read(myTrabScreenControllerProvider.notifier)
                      .handleTapFurniture,
                  text: AppStrings.furnitureT,
                  icon: AppSvgs.furnitureIcon),
            ),
            Positioned(
              top: 144.h,
              left: 26.h,
              child: myTrabIconBtn(
                  onTap: ref
                      .read(myTrabScreenControllerProvider.notifier)
                      .handleTapSnack,
                  text: AppStrings.snack,
                  icon: AppSvgs.snackIcon),
            ),

            //트래비 집 이름
            Positioned(
              top: 280.h,
              child: houseNameWidget(
                controller: textEditingController,
                onSearchChanged: ref
                    .read(myTrabScreenControllerProvider.notifier)
                    .handleSearchChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

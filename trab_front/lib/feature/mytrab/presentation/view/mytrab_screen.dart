import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gif/gif.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/mytrab_view_model.dart';
import 'package:trab_front/feature/common/widget/custom_bubble_text.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/house_name_widget.dart';
import 'package:trab_front/feature/mytrab/presentation/widget/iconbtn.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_gifs.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/constants/strings.dart';

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
              top: 244.h,
              child: houseNameWidget(
                controller: textEditingController,
                onSearchChanged: ref
                    .read(myTrabScreenControllerProvider.notifier)
                    .handleSearchChanged,
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

            Positioned(
              top: 400.h,
              left: 0,
              right: 0,
              bottom: 0.h,
              child: SizedBox(
                height: 221.h,
                width: 148.w,
                child: GestureDetector(
                  onTap: () => ref
                      .read(myTrabScreenControllerProvider.notifier)
                      .handleTabTrab(gifController: gifController),
                  child: Gif(
                    controller: gifController,
                    width: 148.w,
                    height: 221.h,
                    image: AssetImage(AppGifs.smileTrab_1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

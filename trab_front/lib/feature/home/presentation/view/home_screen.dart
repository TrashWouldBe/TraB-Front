import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trab_front/feature/camera/presentation/view/camera_screen.dart';
import 'package:trab_front/feature/flogging/presentation/view/flogging_start_screen.dart';
import 'package:trab_front/feature/home/presentation/viewmodel/home_screen_view_model.dart';
import 'package:trab_front/feature/setting/presentation/view/setting_screen.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = ref.watch(homeScreenControllerProvider).selectedIndex;
    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          bottomNavigationBar: CupertinoTabBar(
            height: 56.h,
            backgroundColor: AppColors.greenGrey,
            border: const Border(top: BorderSide(color: AppColors.grey1)),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.flogging,
                    width: 26.w,
                    height: 26.h,
                    color: _selectedIndex == 0 ? AppColors.accentColor : null),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.camera,
                    width: 26.w,
                    height: 26.h,
                    color: _selectedIndex == 1 ? AppColors.accentColor : null),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.trab,
                    width: 32.w,
                    height: 32.h,
                    color: _selectedIndex == 2 ? AppColors.accentColor : null),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvgs.union,
                    width: 26.w,
                    height: 26.h,
                    color: _selectedIndex == 3 ? AppColors.accentColor : null),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: ref.read(homeScreenControllerProvider.notifier).onItemTapped,
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: const [
              FloggingStartScreen(),
              CameraScreen(),
              SettingScreen()
            ],
          )),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/auth/data/model/user_info_model.dart';
import 'package:trab_front/feature/auth/domain/user_domain.dart';
import 'package:trab_front/helpers/constants/app_images.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initRoute();
    });
  }

  void initRoute() async {
    String? idToken;
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      idToken = await currentUser.getIdToken();
    }

    //login 정보 없음.
    if (idToken == null) {
      AppRouter.pushNamed(Routes.LoginScreenRoute);
      return;
    }

    await ref.read(userControllerProvider.notifier).getUserInfo();
    UserInfoModel? userInfo = ref.read(userControllerProvider).userInfo;

    //uid, email 정보 받아오기 실패. (getUserInfo fail)
    if (userInfo == null) {
      AppRouter.pushNamed(Routes.LoginScreenRoute);
      return;
    }

    //user 정보 없음.
    if (userInfo.name == null && userInfo.weight == null) {
      AppRouter.pushNamed(Routes.TrabOnBoardingScreenRoute);
    } else {
      AppRouter.pushNamed(Routes.HomeScreenRoute);
      await ref.read(userControllerProvider.notifier).getUserInfo();
      UserInfoModel? userInfo = ref.read(userControllerProvider).userInfo;
      if (userInfo == null) {
        AppRouter.pushNamed(Routes.LoginScreenRoute);
      } else {
        if (userInfo.name == null && userInfo.weight == null) {
          AppRouter.pushNamed(Routes.TrabOnBoardingScreenRoute);
        } else {
          AppRouter.pushNamed(Routes.HomeScreenRoute);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userControllerProvider).userInfo;
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.trabLogo,
          width: 258.w,
          height: 102.h,
        ),
      ),
    );
  }
}

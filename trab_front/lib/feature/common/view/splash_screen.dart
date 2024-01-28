import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/myTrab/data/model/trab_model.dart';
import 'package:trab_front/feature/myTrab/domain/trab_domain.dart';

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
    if (idToken == null) {
      AppRouter.pushNamed(Routes.LoginScreenRoute);
    } else {
      TrabModel? trabModel =
          await ref.read(trabControllerProvider.notifier).getTrab();
      if (trabModel == null) {
        AppRouter.pushNamed(Routes.SetTrabNameScreenRoute);
      } else {
        AppRouter.pushNamed(Routes.HomeScreenRoute);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(trabControllerProvider).trab;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/trab_logo.png',
          width: 258.w,
          height: 102.h,
        ),
      ),
    );
  }
}

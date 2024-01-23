import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_themes.dart';
import 'app_bootstrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppBootstrapper.init(
    runApp: runApp,
  );
}

// ignore: must_be_immutable
class TraB extends ConsumerStatefulWidget {
  const TraB({super.key});

  @override
  ConsumerState<TraB> createState() => _TraBState();
}

class _TraBState extends ConsumerState<TraB> {
  @override
  Widget build(BuildContext context) {
    const title = 'Trab';
    const showDebugBanner = false;
    const localizationsDelegates = [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
    const supportedLocales = [
      Locale('en', 'US'),
      Locale('ko', 'KR'),
    ];

    final app = ScreenUtilInit(
      designSize: const Size(390, 844),
      useInheritedMediaQuery: true,
      builder: (context, _) => MaterialApp(
        title: title,
        debugShowCheckedModeBanner: showDebugBanner,
        color: AppColors.primaryColor,
        theme: AppThemes.mainTheme,
        initialRoute: Routes.AppStartupScreenRoute,
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: AppRouter.navigatorKey,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      ),
    );
    return ProviderScope(child: app);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trab_front/feature/presentation/view/google_map.dart';
import 'package:trab_front/feature/presentation/view/temp_screen.dart';

void main() {
  runApp(const ProviderScope(
    child: TraB(),
  ));
}

class TraB extends ConsumerStatefulWidget {
  const TraB({super.key});

  @override
  ConsumerState<TraB> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<TraB> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      useInheritedMediaQuery: true,
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TraB',
        initialRoute: '/map',
        routes: {
          '/map': (context) => const GoogleMapExample(),
          '/': (context) => const TempScreen(),
        },
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'), // 영어
          Locale('ko', 'KR'), // 한국어
        ],
      ),
    );
  }
}

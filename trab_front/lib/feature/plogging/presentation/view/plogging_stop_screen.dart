import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/plogging/presentation/view/map_screen.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_stop_view_model.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';

class PloggingStopScreen extends ConsumerStatefulWidget {
  const PloggingStopScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PloggingStopScreenState();
  }
}

class _PloggingStopScreenState extends ConsumerState<PloggingStopScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(ploggingStopControllerProvider.notifier)
          .showTrabInfos(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 0.h,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SizedBox(
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
          child: const MapScreen(),
        ),
      ),
    );
  }
}

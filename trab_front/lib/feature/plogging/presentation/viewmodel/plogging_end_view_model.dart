import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/feature/plogging/domain/plogging_domain.dart';
import 'package:trab_front/feature/plogging/presentation/types.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/plogging_info_view_model.dart';
import 'package:trab_front/feature/setting/presentation/widget/adaptive_dialog.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

part 'plogging_end_view_model.g.dart';

class PloggingEndScreenState {
  TextEditingController textEditingController;

  PloggingEndScreenState({required this.textEditingController});
}

@Riverpod(keepAlive: true)
class PloggingEndScreenController extends _$PloggingEndScreenController {
  @override
  PloggingEndScreenState build() {
    return PloggingEndScreenState(
      textEditingController: TextEditingController(),
    );
  }

  void handlePressedAppBarButton({required BuildContext context}) async {
    await showCustomDialog(
      context: context,
      title: AppStrings.notSaveWhenNotSettle,
      actions: [
        adaptiveAction(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
            ref.read(ploggingInfoControllerProvider.notifier).endTimer();
            AppRouter.pushNamed(Routes.HomeScreenRoute);
          },
          child: Text(
            AppStrings.notDo,
            style: AppTypography.mainCaption_1.copyWith(color: AppColors.grey1),
          ),
        ),
        adaptiveAction(
          context: context,
          onPressed: Navigator.of(context).pop,
          child: Text(
            AppStrings.close,
            style: AppTypography.mainCaption_1
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  void handleCalculateSnackButton() {
    Loading.show();
    ref.read(ploggingInfoControllerProvider.notifier).endTimer();
    PloggingInfo ploggingInfo =
        ref.read(ploggingInfoControllerProvider).ploggingInfo.copyWith(
              runName: state.textEditingController.text,
            );
    ref
        .read(ploggingControllerProvider.notifier)
        .postPlogging(ploggingInfo: ploggingInfo);
    Loading.close();
    AppRouter.pushNamed(Routes.PloggingCalculateScreenRoute);
  }
}

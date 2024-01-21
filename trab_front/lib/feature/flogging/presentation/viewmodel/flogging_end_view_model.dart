import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/flogging/presentation/viewmodel/flogging_info_view_model.dart';
import 'package:trab_front/feature/setting/presentation/widget/adaptive_dialog.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

part 'flogging_end_view_model.g.dart';

class FloggingEndScreenState {
  FloggingEndScreenState();
}

@Riverpod(keepAlive: true)
class FloggingEndScreenController extends _$FloggingEndScreenController {
  @override
  FloggingEndScreenState build() {
    return FloggingEndScreenState();
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
            ref.read(floggingInfoControllerProvider.notifier).endTimer();

            AppRouter.pushAndRemoveUntil(Routes.HomeScreenRoute);
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
    AppRouter.pushNamed(Routes.FloggingCalculateScreenRoute);
  }
}

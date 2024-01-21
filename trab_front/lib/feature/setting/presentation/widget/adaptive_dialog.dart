import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';

Future<void> showCustomDialog(
    {required BuildContext context,
    required String title,
    String? content,
    required actions}) async {
  await showAdaptiveDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog.adaptive(
      backgroundColor: AppColors.primaryColor.withOpacity(1.0),
      title: Text(
        title,
        style:
            AppTypography.mainCaption_1.copyWith(color: AppColors.textColor_1),
      ),
      content: content == null ? null : Text(content!),
      actions: actions,
    ),
  );
}

Widget adaptiveAction(
    {required BuildContext context,
    required VoidCallback onPressed,
    required Widget child}) {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return TextButton(onPressed: onPressed, child: child);
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return CupertinoDialogAction(onPressed: onPressed, child: child);
  }
}

import 'package:flutter/material.dart';

Widget noPaddingButton({void Function()? onPressed, required Widget child}) {
  return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: child);
}

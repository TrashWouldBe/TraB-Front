import 'package:flutter/material.dart';

///NoPaddingTextButton(onPressed, child)
Widget noPaddingTextButton(
    {void Function()? onPressed, required Widget child}) {
  return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: child);
}

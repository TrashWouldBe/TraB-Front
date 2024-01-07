import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showLoading({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );
}

void closeLoading({required BuildContext context}) {
  Navigator.pop(context);
}

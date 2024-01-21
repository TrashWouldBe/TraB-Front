import 'package:flutter/cupertino.dart';

void showActionSheet(
    {required BuildContext context,
    required void Function() camera,
    required void Function() gallary}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: camera,
          child: const Text('사진 촬영하기'),
        ),
        CupertinoActionSheetAction(
          onPressed: gallary,
          child: const Text('앨범에서 선택하기'),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('취소'),
        ),
      ],
    ),
  );
}

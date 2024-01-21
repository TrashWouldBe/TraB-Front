import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';

part 'sorted_trash_screen_view_model.g.dart';

class SortedTrashScreenState {
  File? image;
  SortedTrashScreenState({required this.image});
}

@riverpod
class SortedTrashScreenController extends _$SortedTrashScreenController {
  @override
  SortedTrashScreenState build() {
    return SortedTrashScreenState(image: null);
  }

  void handlePressedContainerButton() {
    AppRouter.popAndPushNamed(Routes.EattingSnackTrabScreenRoute);
  }
}

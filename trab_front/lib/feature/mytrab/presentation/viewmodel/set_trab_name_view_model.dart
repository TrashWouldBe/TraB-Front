import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_model.dart';
import 'package:trab_front/feature/mytrab/domain/trab_domain.dart';
import 'package:trab_front/feature/mytrab/presentation/viewmodel/mytrab_view_model.dart';

part 'set_trab_name_view_model.g.dart';

class SetTrabNameScreenState {
  FocusNode focusNode;
  TextEditingController textEditingController;
  SetTrabNameScreenState(
      {required this.focusNode, required this.textEditingController});
}

@riverpod
class SetTrabNameScreenController extends _$SetTrabNameScreenController {
  @override
  SetTrabNameScreenState build() {
    return SetTrabNameScreenState(
      focusNode: FocusNode(),
      textEditingController: TextEditingController(),
    );
  }

  void init() {
    state.focusNode.addListener(() {
      state = SetTrabNameScreenState(
          focusNode: state.focusNode,
          textEditingController: state.textEditingController);
    });
  }

  void handlePressedTrailing({required BuildContext context}) async {
    Loading.show();
    TrabModel? trabModel = await ref
        .read(trabControllerProvider.notifier)
        .postTrab(data: {"name": state.textEditingController.text});
    ref.read(myTrabScreenControllerProvider.notifier).init();
    if (trabModel != null) {
      Loading.close();
      AppRouter.pushNamed(Routes.CompleteSetTrabNameScreenRoute);
    } else {
      Loading.close();
    }
  }
}

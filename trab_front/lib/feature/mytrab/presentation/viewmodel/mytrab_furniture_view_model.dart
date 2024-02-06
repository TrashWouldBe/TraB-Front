import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/feature/common/widget/loading.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_furniture_model.dart';
import 'package:trab_front/feature/mytrab/data/model/trab_snack_model.dart';
import 'package:trab_front/feature/mytrab/domain/trab_domain.dart';
import 'package:trab_front/helpers/enums/furniture_type.dart';
import 'package:trab_front/helpers/enums/trash_type.dart';

part 'mytrab_furniture_view_model.g.dart';

class MyTrabFurnitureScreenState {
  MyTrabFurnitureScreenState();
}

@riverpod
class MyTrabFurnitureScreenController
    extends _$MyTrabFurnitureScreenController {
  @override
  MyTrabFurnitureScreenState build() {
    return MyTrabFurnitureScreenState();
  }

  void init() async {
    Loading.show();
    await ref.read(trabControllerProvider.notifier).getTrabSnack();
    await ref.read(trabControllerProvider.notifier).getTrabFunitureList();
    Loading.close();
  }

  bool canPurchaseOrArrange(
      FurnitureType furnitureType, TrabSnackModel? trabSnackModel) {
    if (trabSnackModel == null) return false;
    Map<TrashType, int> requiredTrashCounts = furnitureType.requiredTrash;

    for (var entry in requiredTrashCounts.entries) {
      TrashType key = entry.key;
      int requiredCount = entry.value;

      if (trabSnackModel.getCountForTrashType(key) < requiredCount) {
        return false;
      }
    }
    return true;
  }

  void handleTapPurchaseButton(
      {required TrabFurnitureModel trabFurnitureModel}) async {
    Loading.show();
    await ref.read(trabControllerProvider.notifier).patchTrabFurniture(
      data: {
        "furnitureName": trabFurnitureModel.furnitureEnumType.name,
        ...trabFurnitureModel.furnitureEnumType.requiredTrashJson,
      },
    );
    Loading.close();
    AppRouter.pop();
  }

  void handleTapArrangeButton(
      {required TrabFurnitureModel trabFurnitureModel}) async {
    Loading.show();
    await ref.read(trabControllerProvider.notifier).patchTrabFurnitureArrange(
          funitureName: trabFurnitureModel.furnitureEnumType.name,
        );
    Loading.close();
  }
}

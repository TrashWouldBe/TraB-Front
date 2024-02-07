import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/helpers/constants/app_images.dart';
import 'package:trab_front/helpers/constants/app_svgs.dart';
import 'package:trab_front/helpers/enums/furniture_type.dart';
import 'package:trab_front/helpers/enums/trash_type.dart';

extension FurnitureTypeExtension on FurnitureType {
  static FurnitureType fromString(String string) {
    return FurnitureType.values.firstWhere(
      (type) => type.name.toLowerCase() == string.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid trash type: $string'),
    );
  }

  String toJson() => name;

  String get buttonSvg {
    switch (this) {
      case FurnitureType.trashCan:
        return AppSvgs.trashcanBtn;
      case FurnitureType.familyPhoto:
        return AppSvgs.familyPictureBtn;
      case FurnitureType.table:
        return AppSvgs.tableBtn;
      case FurnitureType.lighting:
        return AppSvgs.lightBtn;
      case FurnitureType.potOfLuck:
        return AppSvgs.luckyPotBtn;
      case FurnitureType.rug:
        return AppSvgs.rugBtn;
      case FurnitureType.wallpaper:
        return AppSvgs.wallpaperBtn;
      case FurnitureType.flooring:
        return AppSvgs.groundBtn;
      default:
        return '';
    }
  }

  String get notiSvg {
    switch (this) {
      case FurnitureType.trashCan:
        return AppSvgs.notiTrashcan;
      case FurnitureType.familyPhoto:
        return AppSvgs.notiFamilyPicture;
      case FurnitureType.table:
        return AppSvgs.notiTable;
      case FurnitureType.lighting:
        return AppSvgs.notiLight;
      case FurnitureType.potOfLuck:
        return AppSvgs.notiLuckyPot;
      case FurnitureType.rug:
        return AppSvgs.notiRug;
      case FurnitureType.wallpaper:
        return AppSvgs.notiWallpaper;
      case FurnitureType.flooring:
        return AppSvgs.notiGround;
      default:
        return '';
    }
  }

  Image get furnitureImage {
    switch (this) {
      case FurnitureType.trashCan:
        return Image.asset(AppImages.trashCan);
      case FurnitureType.familyPhoto:
        return Image.asset(AppImages.photoFrame);
      case FurnitureType.table:
        return Image.asset(AppImages.table);
      case FurnitureType.lighting:
        return Image.asset(AppImages.light);
      case FurnitureType.potOfLuck:
        return Image.asset(AppImages.pot);
      case FurnitureType.rug:
        return Image.asset(
          AppImages.rug,
        );
      case FurnitureType.wallpaper:
        return Image.asset(AppImages.wallPaper);
      case FurnitureType.flooring:
        return Image.asset(AppImages.floor);
      default:
        return Image.asset('');
    }
  }

  Map<TrashType, int> get requiredTrash {
    switch (this) {
      case FurnitureType.trashCan:
        return {
          TrashType.glass: 1,
          TrashType.general: 4,
        };
      case FurnitureType.familyPhoto:
        return {
          TrashType.plastic: 3,
          TrashType.metal: 1,
        };
      case FurnitureType.table:
        return {
          TrashType.plastic: 3,
          TrashType.general: 2,
        };
      case FurnitureType.lighting:
        return {
          TrashType.vinyl: 2,
          TrashType.metal: 2,
        };
      case FurnitureType.potOfLuck:
        return {
          TrashType.food: 3,
          TrashType.vinyl: 2,
        };
      case FurnitureType.rug:
        return {
          TrashType.vinyl: 2,
          TrashType.plastic: 3,
        };
      case FurnitureType.wallpaper:
        return {
          TrashType.paper: 3,
          TrashType.vinyl: 2,
        };
      case FurnitureType.flooring:
        return {
          TrashType.general: 2,
          TrashType.paper: 2,
        };
      default:
        return {};
    }
  }

  Map<String, dynamic> get requiredTrashJson {
    final Map<String, dynamic> json = {};
    requiredTrash.forEach((trashType, count) {
      json[trashType.name] = count;
    });
    return json;
  }

  FurniturePosition get position {
    switch (this) {
      case FurnitureType.trashCan:
        return FurniturePosition(top: 520.h, left: 310.w, bottom: 180.h);
      case FurnitureType.familyPhoto:
        return FurniturePosition(top: 70.0.h, left: 280.w, right: 30.w);
      case FurnitureType.table:
        return FurniturePosition(top: 490.h, right: 280.w, bottom: 200.h);
      case FurnitureType.lighting:
        return FurniturePosition(top: 315.h, bottom: 366.h);
      case FurnitureType.potOfLuck:
        return FurniturePosition(top: 520.h, right: 180.w, bottom: 182.h);
      case FurnitureType.rug:
        return FurniturePosition(bottom: 132.h, top: 560.h);
      case FurnitureType.wallpaper:
        return FurniturePosition(top: 244.h, bottom: 220.h);
      case FurnitureType.flooring:
        return FurniturePosition(top: 545.h);
      default:
        return FurniturePosition();
    }
  }
}

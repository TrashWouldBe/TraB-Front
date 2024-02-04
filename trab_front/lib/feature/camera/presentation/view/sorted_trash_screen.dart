import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/camera/data/model/image_model.dart';
import 'package:trab_front/feature/camera/presentation/viewmodel/camera_screen_view_model.dart';
import 'package:trab_front/feature/camera/presentation/viewmodel/sorted_trash_screen_view_model.dart';
import 'package:trab_front/feature/camera/presentation/widget/sorted_trash_image.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/feature/common/widget/custom_appbar.dart';
import 'package:trab_front/helpers/constants/strings.dart';
import 'package:trab_front/helpers/enums/trash_type.dart';

class SortedTrashScreen extends ConsumerStatefulWidget {
  const SortedTrashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SortedTrashScreenState();
  }
}

class _SortedTrashScreenState extends ConsumerState<SortedTrashScreen> {
  @override
  Widget build(BuildContext context) {
    ImageModel? imageModel =
        ref.watch(cameraScreenControllerProvider).imageModel;
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.sortTrash,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              sortedTrashImage(
                  imageUrl: imageModel!.imageUrl,
                  text: imageModel.trashEnumType.toKorean()),
              SizedBox(
                height: 32.h,
              ),
              Image.asset(
                  "assets/images/seperation_and_discharge_${imageModel.trashEnumType.name}.png"),
              const Spacer(),
              containerButton(
                title: AppStrings.snackToTrab,
                onPressed: ref
                    .read(sortedTrashScreenControllerProvider.notifier)
                    .handlePressedContainerButton,
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

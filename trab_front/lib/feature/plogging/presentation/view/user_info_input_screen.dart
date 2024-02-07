import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trab_front/feature/common/widget/container_button.dart';
import 'package:trab_front/feature/common/widget/container_text_field.dart';
import 'package:trab_front/feature/plogging/presentation/viewmodel/user_info_input_screen_view_model.dart';

import 'package:trab_front/helpers/constants/app_colors.dart';
import 'package:trab_front/helpers/constants/app_typography.dart';
import 'package:trab_front/helpers/constants/strings.dart';

class UserInfoInputScreen extends ConsumerStatefulWidget {
  const UserInfoInputScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserInfoInputScreenState();
  }
}

class _UserInfoInputScreenState extends ConsumerState<UserInfoInputScreen> {
  List<FocusNode> focusNodes = List.generate(2, (_) => FocusNode());
  List<TextEditingController> textEditingControllers =
      List.generate(2, (_) => TextEditingController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userInfoInputScreenControllerProvider.notifier).init(
          textEditingController: textEditingControllers, focusNode: focusNodes);
    });
  }

  @override
  void dispose() {
    focusNodes.forEach((element) {
      element.dispose();
    });
    textEditingControllers.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userInfoInputScreenControllerProvider);
    bool isButtonEnabled = textEditingControllers[0].text != AppStrings.empty &&
        textEditingControllers[1].text != AppStrings.empty;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 47.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 119.h,
                        ),
                        Container(
                          width: 7.w,
                          height: 7.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          "잠깐!\n몸무게를 입력하지 않았나요?",
                          style: AppTypography.body_5.copyWith(
                            height: 1.h,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "몸무게를 입력하지 않으면 칼로리 계산이 되지 않아요.",
                          style: AppTypography.mainCaption_3
                              .copyWith(color: AppColors.grey2),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        containerTextField(
                            hintText: AppStrings.name,
                            textEditingController: textEditingControllers[0],
                            focusNode: focusNodes[0]),
                        SizedBox(
                          height: 16.h,
                        ),
                        containerTextField(
                            hintText: AppStrings.weight,
                            keyboardType: TextInputType.number,
                            textEditingController: textEditingControllers[1],
                            focusNode: focusNodes[1]),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.spMin),
                          child: Text(
                            AppStrings.reasonOfCheckWeight,
                            style: AppTypography.caption_3,
                          ),
                        ),
                        SizedBox(
                          height: 290.h,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: containerButton(
                        onPressed: () => ref
                            .read(
                                userInfoInputScreenControllerProvider.notifier)
                            .handlePressedContainerButton(
                                textEditingController: textEditingControllers),
                        title: isButtonEnabled
                            ? AppStrings.startPlogging
                            : AppStrings.noWeightPlogging,
                        size: "S",
                        textColor:
                            isButtonEnabled ? AppColors.body1 : AppColors.grey2,
                        backgroundColor: isButtonEnabled
                            ? AppColors.primaryColor
                            : AppColors.greenGrey2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

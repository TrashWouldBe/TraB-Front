import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trab_front/config/routes/app_router.dart';
import 'package:trab_front/config/routes/routes.dart';
import 'package:trab_front/feature/myTrab/data/model/trab_model.dart';
import 'package:trab_front/feature/myTrab/domain/trab_domain.dart';

part 'mytrab_view_model.g.dart';

class MyTrabScreenState {
  MyTrabScreenState(
      {required this.trabSay, required this.textEditingController});
  TextEditingController textEditingController;
  String trabSay;
}

@riverpod
class MyTrabScreenController extends _$MyTrabScreenController {
  @override
  MyTrabScreenState build() {
    return MyTrabScreenState(
        trabSay: "안녕하세요!", textEditingController: TextEditingController());
  }

  void setState() {
    state = MyTrabScreenState(
        trabSay: state.trabSay,
        textEditingController: state.textEditingController);
  }

  void init() async {
    TrabModel? trabModel =
        await ref.read(trabControllerProvider.notifier).getTrab();
    if (trabModel == null) {
      AppRouter.pushNamed(Routes.SetTrabNameScreenRoute);
    } else {
      state.textEditingController.text = trabModel.trabName;
      setState();
    }
  }

  void getTrabSay() {
    final int randomSay = Random().nextInt(11);
    if (randomSay == 0) {
      state.trabSay = "오늘도 고마워요!";
    } else if (randomSay == 1) {
      state.trabSay = "오늘도 화이팅!";
    } else if (randomSay == 2) {
      state.trabSay = "간식으로 가구를 살 수 있어요!";
    } else if (randomSay == 3) {
      state.trabSay = "트래비는 행복해요!";
    } else if (randomSay == 4) {
      state.trabSay = "함께 할 수 있어서 좋아요!";
    } else if (randomSay == 5) {
      state.trabSay = "오늘은 좋은 일이 생길 거예요!";
    } else if (randomSay == 6) {
      state.trabSay = "감사한 마음으로 시작해봐요!";
    } else if (randomSay == 7) {
      state.trabSay = "우리 함께 할 수 있어서 기뻐요!";
    } else if (randomSay == 8) {
      state.trabSay = "놀이공원 가고 싶어요!";
    } else if (randomSay == 9) {
      state.trabSay = "간식은 저에게 큰 행복이에요!";
    } else {
      state.trabSay = "오늘도 행복한 하루 보내세요!";
    }
    setState();
  }

  void getTrabEattingSay() {
    final int randomSay = Random().nextInt(2);
    if (randomSay == 0) {
      state.trabSay = "너무 맛있어요!";
    } else if (randomSay == 1) {
      state.trabSay = "너무 고마워요!";
    }
    setState();
  }

  void handleTapFurniture() {
    AppRouter.pushNamed(Routes.MyTrabFurnitureScreenRoute);
  }

  void handleTapSnack() {
    AppRouter.pushNamed(Routes.MyTrabSnackScreenRoute);
  }

  void handleTapTrab() {}
}

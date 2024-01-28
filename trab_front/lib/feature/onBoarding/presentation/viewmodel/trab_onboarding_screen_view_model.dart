import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'trab_onboarding_screen_view_model.g.dart';

class TrabOnBoardingScreenState {
  TrabOnBoardingScreenState();
}

@riverpod
class TrabOnBoardingScreenController extends _$TrabOnBoardingScreenController {
  @override
  TrabOnBoardingScreenState build() {
    return TrabOnBoardingScreenState();
  }

  PageController pageController = PageController(initialPage: 0);
  void handlePageChanged(int index) {
    pageController.
  }

  void handlePressedTrailing() {
    print("여기");
    if (state.selectedIndex == 2) {
      return;
    } else {
      state.selectedIndex++;
      setState();
    }
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_view_model.g.dart';

class HomeScreenState {
  int selectedIndex;
  HomeScreenState({required this.selectedIndex});
}

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  HomeScreenState build() {
    return HomeScreenState(
      selectedIndex: 0,
    );
  }

  void setState() {
    state = HomeScreenState(selectedIndex: state.selectedIndex);
  }

  void onItemTapped(int index) {
    state.selectedIndex = index;
    setState();
  }
}

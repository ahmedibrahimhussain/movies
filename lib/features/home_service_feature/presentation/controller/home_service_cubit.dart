import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/features/browse_feature/presentation/pages/browse_view.dart';
import 'package:movies/features/search_feature/presentation/pages/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../home_feature/presentation/pages/home_view.dart';
import '../../../profile_feature/presentation/pages/profile_view.dart';

part 'home_service_state.dart';

class HomeServiceCubit extends Cubit<HomeServiceState> {

  final PersistentTabController controller;
  HomeServiceCubit()
      : controller = PersistentTabController(initialIndex: 0),
        super(HomeState());



  List<Widget> buildScreens() {
    return [
      const HomeView(),
      const SearchView(),
      const BrowseView(),
      const ProfileView(),
    ];
  }
  void goToHome() {
    controller.jumpToTab(0);
    emit(HomeState());
  }
  void goToSearch() {
    controller.jumpToTab(1);
    emit(SearchState());
  }
void goToCategories() {
    controller.jumpToTab(2);
    emit(CategoryState());
  }
void goToProfile() {
    controller.jumpToTab(3);
    emit(ProfileState());
  }
  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary:ColorManager.primary,
        inactiveColorPrimary: ColorManager.white,
        onPressed: (context) => goToHome(),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Settings"),
        activeColorPrimary:ColorManager.primary,
        inactiveColorPrimary: ColorManager.white,
        onPressed: (context) =>goToSearch(),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.catching_pokemon_outlined),
        title: ("categories"),
        activeColorPrimary:ColorManager.primary,
        inactiveColorPrimary: ColorManager.white,
        onPressed: (context) =>goToCategories(),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary:ColorManager.primary,
        inactiveColorPrimary: ColorManager.white,
        onPressed: (context) =>goToProfile(),
      ),
    ];
  }
}




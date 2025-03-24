import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/recourses/image_manager/image_manager.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  late PageController pageController;

  OnBoardingCubit() : super(OnBoardingInitialState()) {
    pageController = PageController(initialPage: index);
  }

  int index = 0;

  final List<Onboard> data = [
    Onboard(
      title: 'Discover Movies',
      supTitle:
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    ),
    Onboard(
      title: 'Explore All Genres',
      supTitle:
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    ),
    Onboard(
      title: 'Create Watchlists',
      supTitle:
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    ),
    Onboard(
      title: 'Rate, Review, and Learn',
      supTitle:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    ),
    Onboard(
      title: 'Start Watching Now',
      supTitle:
""    ),
  ];

  List<String> images = [
    ImageManager.onBoarding1Image,
    ImageManager.onBoarding2Image,
    ImageManager.onBoarding3Image,
    ImageManager.onBoarding4Image,
    ImageManager.onBoarding5Image,
  ];

  void onPageChanged(int value) {
    index = value;
    emit(OnBoardingChangeState());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

class Onboard {
  final String title, supTitle;

  Onboard({required this.title, required this.supTitle});
}

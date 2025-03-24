

import '../../../data/models/movie_model.dart';

abstract class UpcomingState {}

class UpcomingInitialState extends UpcomingState {}

class UpcomingLoadingState extends UpcomingState {}

class UpcomingSuccessState extends UpcomingState {
   final MovieModel model;

  UpcomingSuccessState(this.model);
}
class UpcomingSearchState extends UpcomingState {}

class UpcomingEmptyState extends UpcomingState {}

class UpcomingFailureState extends UpcomingState {
  final String errorMessage;

  UpcomingFailureState(this.errorMessage);
}

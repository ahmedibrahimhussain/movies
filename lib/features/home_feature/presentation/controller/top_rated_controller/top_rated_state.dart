

import '../../../data/models/movie_model.dart';

abstract class TopRatedState {}

class TopRatedInitialState extends TopRatedState {}

class TopRatedLoadingState extends TopRatedState {}

class TopRatedSuccessState extends TopRatedState {
   final MovieModel model;

  TopRatedSuccessState(this.model);
}
class TopRatedSearchState extends TopRatedState {}

class TopRatedEmptyState extends TopRatedState {}

class TopRatedFailureState extends TopRatedState {
  final String errorMessage;

  TopRatedFailureState(this.errorMessage);
}

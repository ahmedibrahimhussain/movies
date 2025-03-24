


import '../../../home_feature/data/models/movie_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
   final MovieModel model;

  SearchSuccessState( this.model);
}

class SearchEmptyState extends SearchState {}

class SearchFailureState extends SearchState {
  final String errorMessage;

  SearchFailureState(this.errorMessage);
}

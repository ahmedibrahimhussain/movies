
import '../../../../home_feature/data/models/movie_model.dart';

abstract class SimilarState {}

class SimilarInitialState extends SimilarState {}

class SimilarLoadingState extends SimilarState {}

class SimilarSuccessState extends SimilarState {
  final MovieModel model;

  SimilarSuccessState( this.model);
}

class SimilarEmptyState extends SimilarState {}

class SimilarFailureState extends SimilarState {
  final String errorMessage;
  SimilarFailureState(this.errorMessage);
}

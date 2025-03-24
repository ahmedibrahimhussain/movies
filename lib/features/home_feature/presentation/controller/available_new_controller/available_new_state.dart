

import '../../../data/models/movie_model.dart';

abstract class AvailableNewState {}

class AvailableNewInitialState extends AvailableNewState {}

class AvailableNewLoadingState extends AvailableNewState {}

class AvailableNewSuccessState extends AvailableNewState {
   final MovieModel availableNewModel;

  AvailableNewSuccessState(this.availableNewModel);
}
class AvailableNewSearchState extends AvailableNewState {}

class AvailableNewEmptyState extends AvailableNewState {}

class AvailableNewFailureState extends AvailableNewState {
  final String errorMessage;

  AvailableNewFailureState(this.errorMessage);
}

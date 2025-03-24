


import '../../../../home_feature/data/models/movie_model.dart';

abstract class BrowseState {}

class BrowseInitialState extends BrowseState {}

class BrowseLoadingState extends BrowseState {}

class BrowseSuccessState extends BrowseState {
   final MovieModel browseModel;

  BrowseSuccessState( this.browseModel);
}
class BrowseSearchState extends BrowseState {}

class BrowseEmptyState extends BrowseState {}

class BrowseFailureState extends BrowseState {
  final String errorMessage;

  BrowseFailureState(this.errorMessage);
}

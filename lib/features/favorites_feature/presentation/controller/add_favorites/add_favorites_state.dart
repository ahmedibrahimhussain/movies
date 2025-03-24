import 'package:movies/features/favorites_feature/data/model/get_movie_is_favorite_model.dart';



abstract class AddFavoritesState {}

class AddFavoritesInitialState extends AddFavoritesState {}

class AddFavoritesLoadingState extends AddFavoritesState {}

class GetMovieIsFavoriteLoadingState extends AddFavoritesState {}

class AddFavoritesSuccessState extends AddFavoritesState {}

class GetMovieIsFavoriteSuccessState extends AddFavoritesState {
  GetMovieIsFavoriteModel model;
  GetMovieIsFavoriteSuccessState(this.model);
}

class AddFavoritesEmptyState extends AddFavoritesState {}

class AddFavoritesFailureState extends AddFavoritesState {
  final String errorMessage;

  AddFavoritesFailureState(this.errorMessage);
}

class GetMovieIsFavoriteFailureState extends AddFavoritesState {
  final String errorMessage;

  GetMovieIsFavoriteFailureState(this.errorMessage);
}

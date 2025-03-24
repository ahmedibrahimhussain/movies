

abstract class MoviesCategoryState {}

class MoviesCategoryInitialState extends MoviesCategoryState {}

class MoviesCategoryLoadingState extends MoviesCategoryState {}

class MoviesCategorySuccessState extends MoviesCategoryState {

}
class MoviesCategorySearchState extends MoviesCategoryState {}

class MoviesCategoryEmptyState extends MoviesCategoryState {}
class SelectMoviesCategoryState extends MoviesCategoryState {}

class MoviesCategoryFailureState extends MoviesCategoryState {
  final String errorMessage;

  MoviesCategoryFailureState(this.errorMessage);
}

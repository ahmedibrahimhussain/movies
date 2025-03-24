import '../../../data/model/get_favorites_model.dart';

abstract class GetFavoritesState {}

class GetFavoritesInitialState extends GetFavoritesState {}

class GetFavoritesLoadingState extends GetFavoritesState {}
class DelFavoritesLoadingState extends GetFavoritesState {}

class GetFavoritesSuccessState extends GetFavoritesState {
  final GetFavoritesModel model;

  GetFavoritesSuccessState(this.model);
}
class DelFavoritesSuccessState extends GetFavoritesState {}


class GetFavoritesEmptyState extends GetFavoritesState {}

class GetFavoritesFailureState extends GetFavoritesState {
  final String errorMessage;

  GetFavoritesFailureState(this.errorMessage);
}
class DelFavoritesFailureState extends GetFavoritesState {
  final String errorMessage;

  DelFavoritesFailureState(this.errorMessage);
}

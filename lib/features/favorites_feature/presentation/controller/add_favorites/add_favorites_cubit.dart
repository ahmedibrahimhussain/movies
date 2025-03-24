import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/favorites_feature/data/model/add_favorites_params.dart';
import '../../../data/repo/favorites_repo.dart';
import 'add_favorites_state.dart';

class AddFavoritesCubit extends Cubit<AddFavoritesState> {
  final FavoritesRepo _favoritesRepo;
  bool isFavorites=false ;

  AddFavoritesCubit(
    this._favoritesRepo,
  ) : super(AddFavoritesInitialState());

  Future<void> addFavorites(
      {required imageURL,
      required movieId,
      required rating,
      required name,
      required year}) async {
    emit(AddFavoritesLoadingState());
    AddFavoritesParams params = AddFavoritesParams(
        imageURL: imageURL,
        movieId: movieId,
        rating: rating,
        name: name,
        year: year);
    final data = await _favoritesRepo.addFavorites(params);
    data.fold(
      (l) {
        emit(AddFavoritesFailureState(l.errorMessage));
      },
      (r) {
        isFavorites = true;
        emit(AddFavoritesSuccessState());
      },
    );
  }
  Future<void> getIsMovieFavorite({required int id}) async {
    emit(GetMovieIsFavoriteLoadingState());

    final data = await _favoritesRepo.getMovieIsFavorite(id);
    data.fold(
          (l) {
        emit(GetMovieIsFavoriteFailureState(l.errorMessage));
      },
          (r) {
        isFavorites = r.data;
        emit(GetMovieIsFavoriteSuccessState(r));
      },
    );
  }

}

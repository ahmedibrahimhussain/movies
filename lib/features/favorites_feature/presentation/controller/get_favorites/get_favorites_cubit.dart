
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/failure.dart';
import '../../../data/model/get_favorites_model.dart';
import '../../../data/repo/favorites_repo.dart';
import 'get_favorites_state.dart';


class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  final FavoritesRepo _favoritesRepo;

  GetFavoritesCubit(
    this._favoritesRepo,
  ) : super(GetFavoritesInitialState());
  Future<void> getFavorites() async {
    emit(GetFavoritesLoadingState());
    final Either<Failure, GetFavoritesModel> data = await _favoritesRepo.getFavorites();

    data.fold(
      (l) => emit(GetFavoritesFailureState(l.errorMessage)),
      (r) => emit(GetFavoritesSuccessState(r)),
    );
  }

  Future<void> delFavorites(int id) async {
    emit(DelFavoritesLoadingState());
    final  data = await _favoritesRepo.delFavorites(id);

    data.fold(
          (l) => emit(DelFavoritesFailureState(l.errorMessage)),
          (r) {
            getFavorites();
            emit(DelFavoritesSuccessState());
          },
    );
  }

}

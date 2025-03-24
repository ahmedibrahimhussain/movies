import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/browse_feature/data/models/movies_category_model.dart';
import 'package:movies/features/browse_feature/data/repo/browse_repo.dart';
import 'package:movies/features/browse_feature/presentation/controller/browse_controller/browse_cubit.dart';
import '../../../../../../core/api/failure.dart';
import 'movies_category_state.dart';

class MoviesCategoryCubit extends Cubit<MoviesCategoryState> {
  final BrowseRepo _browseRepo;

  MoviesCategoryCubit(this._browseRepo) : super(MoviesCategoryInitialState());
  Genres genres = Genres(id: 28, name: "Action");
  MoviesCategoryModel? model;
  Future<void> getMoviesCategory() async {
    emit(MoviesCategoryLoadingState());
    final Either<Failure, MoviesCategoryModel> data =
        await _browseRepo.getMoviesCategory();

    data.fold(
      (l) => emit(MoviesCategoryFailureState(l.errorMessage)),
      (r) {
        if (r.genres.isEmpty) {
          emit(MoviesCategoryEmptyState());
        } else {
          model = r;
          emit(MoviesCategorySuccessState());
        }
      },
    );
  }

  void chooseCategory(Genres model,BuildContext context) {
    genres = model;
    BlocProvider.of<BrowseCubit>(context).getBrowse(model.id);
    emit(MoviesCategorySuccessState());
  }
}

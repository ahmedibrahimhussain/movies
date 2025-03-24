import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/browse_feature/data/models/browse_prams.dart';
import 'package:movies/features/browse_feature/data/repo/browse_repo.dart';

import '../../../../../../core/api/failure.dart';
import '../../../../home_feature/data/models/movie_model.dart';
import 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  final BrowseRepo _browseRepo;

  BrowseCubit(
    this._browseRepo,
  ) : super(BrowseInitialState());
  Future<void> getBrowse(    int genres
  ) async {

    emit(BrowseLoadingState());
    BrowsePrams prams = BrowsePrams(genres);
    final Either<Failure, MovieModel> data = await _browseRepo.getBrowse(prams);

    data.fold(
      (l) => emit(BrowseFailureState(l.errorMessage)),
      (r) {
        if (r.results.isEmpty) {
          emit(BrowseEmptyState());
        } else {
          emit(BrowseSuccessState(r));
        }
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/details_feature/presentation/controller/similar_controller/similar_state.dart';
import 'package:movies/features/home_feature/data/models/movie_model.dart';

import '../../../../../../core/api/failure.dart';
import '../../../data/repo/details_repo.dart';

class SimilarCubit extends Cubit<SimilarState> {
  final DetailsRepo _detailsRepo;

  SimilarCubit(
    this._detailsRepo
  ) : super(SimilarInitialState());
  Future<void> getSimilar(int id) async {
    emit(SimilarLoadingState());
    final Either<Failure, MovieModel> data =
        await _detailsRepo.getSimilarMovie(id: id);

    data.fold(
      (l) => emit(SimilarFailureState(l.errorMessage)),
      (r) {
        if (r.results.isEmpty) {
          emit(SimilarEmptyState());
        } else {

          emit(SimilarSuccessState (r ));
        }
      },
    );
  }


}

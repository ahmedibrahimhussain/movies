import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home_feature/presentation/controller/top_rated_controller/top_rated_state.dart';

import '../../../../../../core/api/failure.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/repo/home_view_repo.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final HomeViewRepo _homeViewRepo;

  TopRatedCubit(this._homeViewRepo) : super(TopRatedInitialState());

  Future<void> getTopRated() async {
    emit(TopRatedLoadingState());
    final Either<Failure, MovieModel> data =
        await _homeViewRepo.getTopRated();

    data.fold(
      (l) => emit(TopRatedFailureState(l.errorMessage)),
      (r) {
        if (r.results.isEmpty) {
          emit(TopRatedEmptyState());
        } else {
          emit(TopRatedSuccessState(r));
        }
      },
    );
  }
}

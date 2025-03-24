import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home_feature/presentation/controller/upcoming_controller/upcoming_state.dart';

import '../../../../../../core/api/failure.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/repo/home_view_repo.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  final HomeViewRepo _homeViewRepo;

  UpcomingCubit(this._homeViewRepo) : super(UpcomingInitialState());

  Future<void> getUpcoming() async {
    emit(UpcomingLoadingState());
    final Either<Failure, MovieModel> data =
        await _homeViewRepo.getUpcoming();

    data.fold(
      (l) => emit(UpcomingFailureState(l.errorMessage)),
      (r) {
        if (r.results.isEmpty) {
          emit(UpcomingEmptyState());
        } else {
          emit(UpcomingSuccessState(r));
        }
      },
    );
  }
}

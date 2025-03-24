import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/api/failure.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/repo/home_view_repo.dart';
import 'available_new_state.dart';

class AvailableNewCubit extends Cubit<AvailableNewState> {
  final HomeViewRepo _homeViewRepo;

  AvailableNewCubit(this._homeViewRepo) : super(AvailableNewInitialState());

  Future<void> getAvailableNew() async {
    emit(AvailableNewLoadingState());
    final Either<Failure, MovieModel> data =
        await _homeViewRepo.getAvailableNew();

    data.fold(
      (l) => emit(AvailableNewFailureState(l.errorMessage)),
      (r) {
        if (r.results.isEmpty) {
          emit(AvailableNewEmptyState());
        } else {
          emit(AvailableNewSuccessState(r));
        }
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/details_feature/data/model/details_model.dart';

import '../../../../../../core/api/failure.dart';
import '../../../data/repo/details_repo.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsRepo _detailsRepo;

  DetailsCubit(
    this._detailsRepo
  ) : super(DetailsInitialState());
  Future<void> getDetails(int id) async {
    emit(DetailsLoadingState());
    final Either<Failure, DetailsModel> data =
        await _detailsRepo.getMovieDetails(id: id);

    data.fold(
      (l) => emit(DetailsFailureState(l.errorMessage)),
      (r) {
        if (r.id ==null) {
          emit(DetailsEmptyState());
        } else {
          emit(DetailsSuccessState(r));
        }
      },
    );
  }

}

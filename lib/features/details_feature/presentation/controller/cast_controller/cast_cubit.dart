import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/details_feature/data/model/cast_model.dart';

import '../../../../../../core/api/failure.dart';
import '../../../data/repo/details_repo.dart';
import 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final DetailsRepo _detailsRepo;

  CastCubit(
    this._detailsRepo
  ) : super(CastInitialState());
  Future<void> getCast(int id) async {
    emit(CastLoadingState());
    final Either<Failure, CastModel> data =
        await _detailsRepo.getMovieCast(id: id);

    data.fold(
      (l) => emit(CastFailureState(l.errorMessage)),
      (r) {
        if (r.cast.isEmpty) {
          emit(CastEmptyState());
        } else {
          emit(CastSuccessState (r ));
        }
      },
    );
  }


}

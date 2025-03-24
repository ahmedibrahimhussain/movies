import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/search_feature/presentation/controller/search_state.dart';

import '../../../../../../core/api/failure.dart';
import '../../../home_feature/data/models/movie_model.dart';
import '../../data/models/search_prams.dart';
import '../../data/repo/browse_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _browseRepo;
  TextEditingController? searchKeyword= TextEditingController();
  SearchCubit(
    this._browseRepo,
  ) : super(SearchInitialState());
  Future<void> getSearch() async {
    emit(SearchLoadingState());
    SearchPrams prams = SearchPrams( searchKeyword?.text??"");
    final Either<Failure, MovieModel> data = await _browseRepo.getSearch(prams);

    data.fold(
      (l) => emit(SearchFailureState(l.errorMessage)),
      (r) {
        if (r.results.isEmpty) {
          emit(SearchEmptyState());
        } else {
          emit(SearchSuccessState(r));
        }
      },
    );
  }
}

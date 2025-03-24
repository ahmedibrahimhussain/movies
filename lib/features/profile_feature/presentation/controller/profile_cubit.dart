
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/profile_feature/presentation/controller/profile_state.dart';

import '../../../../core/api/failure.dart';
import '../../data/model/profile/profile_model.dart';
import '../../data/repo/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(
    this._profileRepo,
  ) : super(ProfileInitialState());
  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    final Either<Failure, ProfileModel> data = await _profileRepo.getProfile();

    data.fold(
      (l) => emit(ProfileFailureState(l.errorMessage)),
      (r) => emit(ProfileSuccessState(r)),
    );
  }
}

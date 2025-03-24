



import '../../data/model/profile/profile_model.dart';

abstract class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
   final ProfileModel model;

  ProfileSuccessState( this.model);
}
class ProfileSearchState extends ProfileState {}

class ProfileEmptyState extends ProfileState {}

class ProfileFailureState extends ProfileState {
  final String errorMessage;

  ProfileFailureState(this.errorMessage);
}

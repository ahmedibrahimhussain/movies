import '../../../data/models/register_models/register_model.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final RegisterModel model;

  RegisterSuccessState(this.model);
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}

class RegisterPasswordVisibilityState extends RegisterState {}

class RegisterConfirmPasswordVisibilityState extends RegisterState {}

class RegisterGenderChangedState extends RegisterState {}

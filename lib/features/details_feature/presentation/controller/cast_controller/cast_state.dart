
import '../../../data/model/cast_model.dart';

abstract class CastState {}

class CastInitialState extends CastState {}

class CastLoadingState extends CastState {}

class CastSuccessState extends CastState {
  final CastModel castModel;

  CastSuccessState(this.castModel);
}

class CastEmptyState extends CastState {}

class CastFailureState extends CastState {
  final String errorMessage;
  CastFailureState(this.errorMessage);
}

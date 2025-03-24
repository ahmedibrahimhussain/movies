


import 'package:movies/features/details_feature/data/model/details_model.dart';


abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
   final DetailsModel model;

  DetailsSuccessState( this.model, );
}
class DetailsEmptyState extends DetailsState {}

class DetailsFailureState extends DetailsState {
  final String errorMessage;

  DetailsFailureState(this.errorMessage);
}

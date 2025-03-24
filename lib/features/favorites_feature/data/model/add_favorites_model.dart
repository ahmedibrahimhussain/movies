import 'package:equatable/equatable.dart';
import 'add_favorites_data_model.dart';



class AddFavoritesModel extends Equatable {
  final AddFavoritesDataModel data;

  const AddFavoritesModel({
    required this.data,
  });

  factory AddFavoritesModel.fromJson(Map<String, dynamic> json) {
    return AddFavoritesModel(
      data: json['data']);

  }

  @override
  List<Object?> get props => [
    data,
  ];
}

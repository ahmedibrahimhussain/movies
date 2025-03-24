import 'package:equatable/equatable.dart';

import 'get_favorites_data_model.dart';



class GetFavoritesModel extends Equatable {
  final List<GetFavoritesDataModel> data;

  const GetFavoritesModel({
    required this.data,
  });

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModel(
      data: List.from((json['data'] as List)
          .map((e) => GetFavoritesDataModel.fromJson(e))
          .toList())
    );
  }

  @override
  List<Object?> get props => [
    data,
  ];
}

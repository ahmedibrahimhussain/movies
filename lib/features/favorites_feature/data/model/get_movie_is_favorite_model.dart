import 'package:equatable/equatable.dart';



class GetMovieIsFavoriteModel extends Equatable {
  final bool data;

  const GetMovieIsFavoriteModel({
    required this.data,
  });

  factory GetMovieIsFavoriteModel.fromJson(Map<String, dynamic> json) {
    return GetMovieIsFavoriteModel(
      data: json['data']);

  }

  @override
  List<Object?> get props => [
    data,
  ];
}

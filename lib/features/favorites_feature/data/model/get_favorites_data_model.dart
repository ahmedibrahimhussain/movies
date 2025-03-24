import 'package:equatable/equatable.dart';

class GetFavoritesDataModel extends Equatable {
  final String? movieId;
  final String? name;
  final double? rating;
  final String? imageURL;
  final String? year;




  const GetFavoritesDataModel({
     required this.imageURL,
    required this.movieId,
    required this.rating,
    required  this.name,
    required this.year,

  });

  factory GetFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesDataModel(
      movieId: json['movieId'],
      name: json['name'],
      rating: json['rating'],
      imageURL: json['imageURL'],
      year: json['year'],

    );
  }

  @override
  List<Object?> get props => [
       movieId,name,rating,imageURL,year
      ];
}

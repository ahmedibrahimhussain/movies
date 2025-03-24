import 'package:equatable/equatable.dart';

class AddFavoritesDataModel extends Equatable {
  final String? movieId;
  final String? name;
  final double? rating;
  final String? imageURL;
  final String? year;




  const AddFavoritesDataModel({
     required this.imageURL,
    required this.movieId,
    required this.rating,
    required  this.name,
    required this.year,

  });

  factory AddFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return AddFavoritesDataModel(
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

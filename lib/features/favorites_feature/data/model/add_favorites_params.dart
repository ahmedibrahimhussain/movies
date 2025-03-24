import 'package:equatable/equatable.dart';

class AddFavoritesParams extends Equatable {
  final String? movieId;
  final String? name;
  final double? rating;
  final String? imageURL;
  final String? year;




  const AddFavoritesParams({
     required this.imageURL,
    required this.movieId,
    required this.rating,
    required  this.name,
    required this.year,

  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['movieId'] = movieId;
    data['name'] = name;
    data['rating'] = rating;
    data['imageURL'] = imageURL;
    data['year'] = year;
    return data;
  }


  @override
  List<Object?> get props => [
       movieId,name,rating,imageURL,year
      ];
}

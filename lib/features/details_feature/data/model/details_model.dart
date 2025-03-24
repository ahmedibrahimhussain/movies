import '../../../browse_feature/data/models/movies_category_model.dart';

class DetailsModel {
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final List<Genres>? genres;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final int? runtime;
  final String? status;
  final String? tagline;
  final int? revenue;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  DetailsModel(
      {required this.adult,
      required this.backdropPath,
      required this.budget,
      required this.genres,
      required this.id,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.runtime,
      required this.status,
      required this.tagline,
      required this.revenue,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
        adult: json['adult'],
        revenue: json['revenue'],
        backdropPath: json['backdrop_path'],
        budget: json['budget'],
        genres:  List.from(
          (json['genres'] as List).map((e) => Genres.fromJson(e)).toList(),
        ),
        id: json['id'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}

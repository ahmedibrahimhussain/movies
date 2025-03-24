class MovieModel {
  final List<Results> results;

  MovieModel({
    required this.results,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        results: List.from((json['results'] as List)
            .map((e) => Results.fromJson(e))
            .toList()));
  }
}

class Results {

  final int id;
  final String? posterPath;
  final double? voteAverage;

  Results({

    required this.id,

    required this.posterPath,
    required this.voteAverage,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(

      id: json['id'],

      posterPath: json['poster_path'],

      voteAverage: json['vote_average'],
    );
  }
}

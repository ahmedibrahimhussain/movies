class MoviesCategoryModel {
  final List<Genres> genres;

  MoviesCategoryModel({required this.genres});

  factory MoviesCategoryModel.fromJson(Map<String, dynamic> json) {
    return MoviesCategoryModel(
      genres: List.from(
        (json['genres'] as List).map((e) => Genres.fromJson(e)).toList(),
      ),
    );
  }
}

class Genres {
  final int id;
  final String name;

  Genres({
    required this.id,
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
    );
  }
}

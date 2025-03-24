import 'package:equatable/equatable.dart';

class BrowsePrams extends Equatable {
  final int genres;

  const BrowsePrams(this.genres);

  Map<String, dynamic> toJson() {
    return {
      'with_genres': "$genres",
    };
  }

  @override
  List<Object?> get props => [genres];
}

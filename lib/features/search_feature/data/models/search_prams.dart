import 'package:equatable/equatable.dart';

class SearchPrams extends Equatable {
  final String keyWord;

  const SearchPrams(this.keyWord);

  Map<String, dynamic> toJson() {
    return {
      'query': keyWord,
    };
  }

  @override
  List<Object?> get props => [keyWord];
}

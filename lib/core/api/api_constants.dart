
class ApiConstants{
  static const String token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTQ2M2I1ZmE0MDU3MzdmNTVjNWNmNTgxMGVhNjkxMyIsIm5iZiI6MTczODgxMjE5NS44NDgsInN1YiI6IjY3YTQyYjIzYmYzNjA0MGM1ZDg1YWZhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3opMNtRlJ_w22evxHFaTJNcBSXeETad6nphYhaucy8U";

  ///Base
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const String authBaseUrl = "https://route-movie-apis.vercel.app/";
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String getAvailableNew = "movie/now_playing";
  static const String getBrowse = "discover/movie";
  static const String getProfile = "profile";
  static const String getFavorites = "favorites/all";
  static const String addFavorites = "favorites/add";
  static  String getMovieIsFavorite (int id) => "favorites/is-favorite/$id";
  static  String delFavorites (int id) => "favorites/remove/$id";
  static const String getMoviesCategory = "genre/movie/list";
  static const String getTopRated = "movie/top_rated";
  static const String getUpcoming = "movie/upcoming";
  static const String getSearch = "search/movie";
  static  String getMovieDetails(int id) => "movie/$id";
  static  String getMovieCast(int id) => "movie/$id/credits";
  static  String getSimilarMovie(int id) => "movie/$id/similar";


}


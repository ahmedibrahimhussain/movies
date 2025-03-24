import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/api/api_service.dart';
import 'package:movies/core/api/dio_exception_handler.dart';
import 'package:movies/core/api/failure.dart';
import 'package:movies/features/favorites_feature/data/model/add_favorites_params.dart';
import 'package:movies/features/favorites_feature/data/model/get_movie_is_favorite_model.dart';

import '../../../../main.dart';
import '../model/get_favorites_model.dart';

class FavoritesRepo {
  final AuthApiService _apiService;
  FavoritesRepo(this._apiService);

  Future<Either<Failure, GetFavoritesModel>> getFavorites() async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getFavorites,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      GetFavoritesModel model = GetFavoritesModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(dioExceptionHandler(ex)),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }

  Future<Either<Failure, GetMovieIsFavoriteModel>> getMovieIsFavorite(
    int id
  ) async {
    try {
      Response response =
          await _apiService.dio.get(ApiConstants.getMovieIsFavorite(id),
              options: Options(
                headers: {'Authorization': 'Bearer $token'},
              ));
      GetMovieIsFavoriteModel model =
          GetMovieIsFavoriteModel.fromJson(response.data);
      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(dioExceptionHandler(ex)),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }

  Future addFavorites(AddFavoritesParams params) async {
    try {
      Response response = await _apiService.dio.post(ApiConstants.addFavorites,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          data: params.toJson());

      return Right(response.data);
    } on DioException catch (ex) {
      return Left(
        Failure(dioExceptionHandler(ex)),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }


  Future delFavorites(int id ) async {
    try {
      Response response = await _apiService.dio.delete(ApiConstants.delFavorites(id),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
       );

      return Right(response.data);
    } on DioException catch (ex) {
      return Left(
        Failure(dioExceptionHandler(ex)),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/api/api_service.dart';
import 'package:movies/core/api/dio_exception_handler.dart';
import 'package:movies/core/api/failure.dart';
import 'package:movies/features/details_feature/data/model/cast_model.dart';
import 'package:movies/features/details_feature/data/model/details_model.dart';
import 'package:movies/features/home_feature/data/models/movie_model.dart';

class DetailsRepo {
  final ApiService _apiService;
  DetailsRepo(this._apiService);

  Future<Either<Failure, DetailsModel>> getMovieDetails({
    required int id
  }) async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getMovieDetails(id),
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
        ),
      );

      DetailsModel model = DetailsModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(
          dioExceptionHandler(ex),
        ),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }

  Future<Either<Failure, CastModel>> getMovieCast({
    required int id
  }) async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getMovieCast(id),
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
        ),
      );
      CastModel model = CastModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(
          dioExceptionHandler(ex),
        ),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }
  Future<Either<Failure, MovieModel>> getSimilarMovie({
    required int id
  }) async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getSimilarMovie(id),
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
        ),
      );

      MovieModel model = MovieModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(
          dioExceptionHandler(ex),
        ),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }

}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_constants.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../../../core/api/failure.dart';
import '../models/movie_model.dart';

class HomeViewRepo{
  final ApiService _apiService;

  const HomeViewRepo(this._apiService);

  Future<Either<Failure, MovieModel>> getAvailableNew() async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getAvailableNew,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
        ),
      );

      MovieModel model = MovieModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(Failure(dioExceptionHandler(ex)));
    } catch (ex) {
      return Left(
        Failure(ex.toString()),
      );
    }
  }
  Future<Either<Failure, MovieModel>> getTopRated() async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getTopRated,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
        ),
      );

      MovieModel model = MovieModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(Failure(dioExceptionHandler(ex)));
    } catch (ex) {
      return Left(
        Failure(ex.toString()),
      );
    }
  }
  Future<Either<Failure, MovieModel>> getUpcoming() async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getUpcoming,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
        ),
      );

      MovieModel model = MovieModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(Failure(dioExceptionHandler(ex)));
    } catch (ex) {
      return Left(
        Failure(ex.toString()),
      );
    }
  }


}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/features/browse_feature/data/models/browse_prams.dart';

import '../../../../../core/api/api_constants.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../../../core/api/failure.dart';
import '../../../home_feature/data/models/movie_model.dart';
import '../models/movies_category_model.dart';

class BrowseRepo {
  final ApiService _apiService;

  const BrowseRepo(this._apiService);

  Future<Either<Failure, MovieModel>> getBrowse(BrowsePrams prams) async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getBrowse,
        queryParameters: prams.toJson(),
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

  Future<Either<Failure, MoviesCategoryModel>> getMoviesCategory() async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getMoviesCategory,
        options: Options(
          headers: {'Authorization': 'Bearer ${ApiConstants.token}'},
        ),
      );
      MoviesCategoryModel model = MoviesCategoryModel.fromJson(response.data);
      return Right(model);
    } on DioException catch (ex) {
      return left(Failure(dioExceptionHandler(ex)));
    } catch (ex) {
      return left(Failure(ex.toString()));
    }
  }
}

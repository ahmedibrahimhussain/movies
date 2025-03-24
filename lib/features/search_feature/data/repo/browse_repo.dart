import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/api/api_constants.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../../../core/api/failure.dart';
import '../../../home_feature/data/models/movie_model.dart';
import '../models/search_prams.dart';

class SearchRepo {
  final ApiService _apiService;

  const SearchRepo(this._apiService);

  Future<Either<Failure, MovieModel>> getSearch(SearchPrams prams) async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getSearch,
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

}

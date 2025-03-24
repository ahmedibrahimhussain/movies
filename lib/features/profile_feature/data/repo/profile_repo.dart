import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/api/api_service.dart';
import 'package:movies/core/api/dio_exception_handler.dart';
import 'package:movies/core/api/failure.dart';

import '../../../../main.dart';
import '../model/profile/profile_model.dart';

class ProfileRepo {
  final AuthApiService _apiService;
  ProfileRepo(this._apiService);

  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getProfile,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      ProfileModel model = ProfileModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(dioExceptionHandler(ex)),
      );
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }
}

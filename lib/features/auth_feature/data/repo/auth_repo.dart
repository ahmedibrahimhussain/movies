import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/api/api_service.dart';
import 'package:movies/core/api/dio_exception_handler.dart';
import 'package:movies/core/api/failure.dart';
import 'package:movies/features/auth_feature/data/models/login_models/login_body.dart';
import 'package:movies/features/auth_feature/data/models/login_models/login_model.dart';
import 'package:movies/features/auth_feature/data/models/register_models/register_body.dart';
import 'package:movies/features/auth_feature/data/models/register_models/register_model.dart';

class AuthRepo {
  final AuthApiService _authApiService;
  AuthRepo(this._authApiService);

  Future<Either<Failure, LoginModel>> login(LoginBody params) async {
    try {
      Response response =
          await _authApiService.dio.post(ApiConstants.login, data: params.toJson());

      LoginModel model = LoginModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(
          dioExceptionHandler(ex).toString(),
        ),
      );
    } catch (ex) {
      return left(
        Failure(
          ex.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, RegisterModel>> register(RegisterBody params) async {
    try {
      Response response = await _authApiService.dio
          .post(ApiConstants.register, data: params.toJson());
      RegisterModel model = RegisterModel.fromJson(response.data);
      return Right(model);
    } on DioException catch (ex) {
      return Left(
        Failure(dioExceptionHandler(ex).toString()),
      );
    } catch (ex) {
      return left(
        Failure(ex.toString()),
      );
    }
  }
}

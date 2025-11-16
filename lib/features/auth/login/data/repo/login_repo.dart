import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/features/auth/login/data/models/login_request_model.dart';
import 'package:rizq/features/auth/login/data/repo/base_login_repo.dart';

final class LoginRepo extends BaseLoginRepo{

  const LoginRepo({required super.apiService});

  @override
  Future<Either<Failure, Response<dynamic>>> login({required LoginRequestModel model}) async{

    try {
      var response = await apiService.post(
          '',
          body: model.toJson(),
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
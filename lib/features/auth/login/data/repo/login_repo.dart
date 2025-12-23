import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/core/api_service/endpoints.dart';
import 'package:rizq/core/locale_storage/cache_helper.dart';
import 'package:rizq/core/locale_storage/cache_keys.dart';
import 'package:rizq/features/auth/login/data/models/login_request_model.dart';
import 'package:rizq/features/auth/login/data/repo/base_login_repo.dart';

final class LoginRepo extends BaseLoginRepo{

  const LoginRepo({required super.apiService});

  @override
  Future<Either<Failure, Response<dynamic>>> login({required LoginRequestModel model}) async{

    try {
      var response = await apiService.post(
          Endpoints.loginEndpoint,
          body: FormData.fromMap(model.toJson()),
      );

      CacheHelper.put(key: CacheKeys.accessToken, value: response.data['access_token']);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
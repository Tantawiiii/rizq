import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/core/api_service/endpoints.dart';
import 'package:rizq/features/auth/register/data/models/register_request_model.dart';
import 'package:rizq/features/auth/register/data/repo/base_register_repo.dart';

final class RegisterRepo extends BaseRegisterRepo{
  const RegisterRepo(super.apiService);

  @override
  Future <Either<Failure, Response>>registerUser({required RegisterRequestModel registerRequestModel,ProgressCallback? onSendProgress}) async {
    try {
      var response = await apiService.post(
        Endpoints.registerEndpoint,
        body: registerRequestModel.toFormData(),
        onSendProgress: onSendProgress
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

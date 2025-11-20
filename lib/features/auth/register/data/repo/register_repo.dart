import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/core/network/api_constants.dart';
import 'package:rizq/features/auth/register/data/models/register_request_model.dart';
import 'package:rizq/features/auth/register/data/repo/base_register_repo.dart';

final class RegisterRepo extends BaseRegisterRepo{
  const RegisterRepo(super.apiService);

  @override
  Future <Either<Failure, Response>>registerUser({required RegisterRequestModel registerRequestModel,void Function(int, int)? onSendProgress}) async {
    try {
      var response = await apiService.post(
        ApiConstants.registerEndpoint,
        body: registerRequestModel.toFrmData(),
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

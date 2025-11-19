import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/core/network/api_constants.dart';
import 'package:rizq/features/auth/forget_password/data/models/reser_password_request_model.dart';
import 'package:rizq/features/auth/forget_password/data/repo/base_forget_password_repo.dart';

final class ForgetPasswordRepo extends BaseForgetPasswordRepo{

  const ForgetPasswordRepo(super.apiService);

  @override
  Future<Either<Failure, Response>> sendForgetPasswordOtp({required String email})async{
    try {
      var response = await apiService.post(
        ApiConstants.sendResetPasswordOtpEndpoint,
        body: FormData.fromMap({'email':email}),
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, Response>> resetPassword({required ResetPasswordRequestModel model})async{
    try {
      var response = await apiService.post(
        ApiConstants.resetPasswordEndpoint,
        body: FormData.fromMap(model.toJson()),
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
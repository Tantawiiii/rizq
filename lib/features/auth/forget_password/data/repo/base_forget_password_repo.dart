import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/api_service/base_api_service.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/features/auth/forget_password/data/models/reser_password_request_model.dart';

abstract class BaseForgetPasswordRepo {

  final BaseApiService apiService;
  const BaseForgetPasswordRepo(this.apiService);

  Future<Either<Failure, Response>> sendForgetPasswordOtp({required String email});
  Future<Either<Failure, Response>> resetPassword({required ResetPasswordRequestModel model});

}
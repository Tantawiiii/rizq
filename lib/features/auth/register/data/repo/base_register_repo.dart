import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/api_service/base_api_service.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/features/auth/register/data/models/register_request_model.dart';

abstract class BaseRegisterRepo {

  final BaseApiService apiService;
  const BaseRegisterRepo(this.apiService);

  Future<Either<Failure, Response>> registerUser({required RegisterRequestModel registerRequestModel, void Function(int, int)? onSendProgress});
}


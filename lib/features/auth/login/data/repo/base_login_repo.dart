import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/api_service/base_api_service.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/features/auth/login/data/models/login_request_model.dart';

abstract class BaseLoginRepo {

  final BaseApiService apiService;

  const BaseLoginRepo({required this.apiService});

  Future<Either<Failure,Response>> login({required LoginRequestModel model});
}
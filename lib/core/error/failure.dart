import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/generated/locale_keys.g.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure(LocaleKeys.apiErrors_connectionTimeout.tr());

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response?.statusCode, dioError.response?.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with ApiServer');

      case DioExceptionType.unknown:
        debugPrint('dioError.message: ${dioError.toString()}');
        if (dioError.message!=null&& dioError.message!.contains('SocketException')) {
          return ServerFailure(LocaleKeys.apiErrors_noInternetConnection.tr());
        }
        return ServerFailure(LocaleKeys.apiErrors_apiGeneralError.tr());
      default:
        return ServerFailure(LocaleKeys.apiErrors_apiGeneralError.tr());
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(LocaleKeys.apiErrors_api404Error.tr());
    } else if ((statusCode?? 1) >= 500) {
      return ServerFailure(LocaleKeys.apiErrors_api5xxError.tr());
    } else {
      return ServerFailure(LocaleKeys.apiErrors_apiGeneralError.tr());
    }
  }
}
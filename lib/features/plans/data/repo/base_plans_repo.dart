import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/api_service/base_api_service.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/features/plans/data/models/bouquet_model.dart';

abstract class BasePlansRepo {
  final BaseApiService apiService;
  const BasePlansRepo({required this.apiService});
  Future<Either<Failure,List<BouquetModel>>> getSubscriptionBouquets();
}
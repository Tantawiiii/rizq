import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/core/api_service/endpoints.dart';
import 'package:rizq/features/plans/data/models/bouquet_model.dart';
import 'package:rizq/features/plans/data/repo/base_plans_repo.dart';

final class PlansRepo extends BasePlansRepo{

  const PlansRepo({required super.apiService});

  @override
  Future<Either<Failure,List<BouquetModel>>>  getSubscriptionBouquets() async{
    try {
      var response = await apiService.get(
        Endpoints.subscriptionBouquetsEndpoint,
      );
      return right(List.from(response.data['data']).map((b)=>BouquetModel.fromJson(b)).toList());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
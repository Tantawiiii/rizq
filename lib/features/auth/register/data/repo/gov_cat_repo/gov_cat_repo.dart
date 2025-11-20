
// TODO: IF YOU WANNA PLACE IT IN ANOTHER FILE, DO, but keep this repo separated because the whole app may need govs and cats not only register feature
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/core/network/api_constants.dart';
import 'package:rizq/features/auth/register/data/models/category_model.dart';
import 'package:rizq/features/auth/register/data/models/governorate_model.dart';

import 'base_gov_cat_repo.dart';

final class GovCatRepo extends BaseGovCatRepo{
  const GovCatRepo(super.apiService);

  @override
  Future<Either<Failure, List<GovernorateModel>>> getGovernorates() async {
    try {
      var response = await apiService.get(
        ApiConstants.governoratesEndpoint,
      );

      List<GovernorateModel> governorates = (response.data['data'] as List).map((e) => GovernorateModel.fromJson(e)).toList();

      return right(governorates);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      var response = await apiService.get(
        ApiConstants.categoriesEndpoint,
      );

      List<CategoryModel> categories = (response.data['data'] as List).map((e) => CategoryModel.fromJson(e)).toList();

      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
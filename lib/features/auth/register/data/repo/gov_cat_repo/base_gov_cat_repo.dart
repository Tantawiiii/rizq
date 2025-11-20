import 'package:dartz/dartz.dart';
import 'package:rizq/core/api_service/base_api_service.dart';
import 'package:rizq/core/error/failure.dart';
import 'package:rizq/features/auth/register/data/models/category_model.dart';
import 'package:rizq/features/auth/register/data/models/governorate_model.dart';

abstract class BaseGovCatRepo {

  final BaseApiService apiService;
  const BaseGovCatRepo(this.apiService);

  Future<Either<Failure, List<GovernorateModel>>> getGovernorates();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}
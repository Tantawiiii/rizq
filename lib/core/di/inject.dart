import 'package:get_it/get_it.dart';
import 'package:rizq/core/api_service/api_service.dart';
import 'package:rizq/core/locale_storage/cache_helper.dart';
import 'package:rizq/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:rizq/features/auth/login/cubit/login_cubit.dart';
import 'package:rizq/features/auth/login/data/repo/login_repo.dart';
import 'package:rizq/features/auth/outer_screens/cubit/general_register_cubit.dart';
import 'package:rizq/features/auth/register/data/repo/gov_cat_repo/gov_cat_repo.dart';
import 'package:rizq/features/auth/register/data/repo/register_repo.dart';
import 'package:rizq/features/auth/register/logic/register_cubit.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/logic/create_ad_cubit/create_ad_cubit.dart';
import 'package:rizq/features/plans/data/repo/plans_repo.dart';
import 'package:rizq/features/plans/logic/payment_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';



final sl = GetIt.instance;

Future<void> init() async {
  // External
  await CacheHelper.init();

  //services

  sl.registerLazySingleton(()=>ChildApiService());

  // repos
  sl.registerLazySingleton(()=>LoginRepo(apiService: sl<ChildApiService>()));
  sl.registerLazySingleton(()=>RegisterRepo(sl<ChildApiService>()));
  sl.registerLazySingleton(()=>ForgetPasswordRepo(sl<ChildApiService>()));
  sl.registerLazySingleton(()=>GovCatRepo(sl<ChildApiService>()));
  sl.registerLazySingleton(()=>PlansRepo(apiService: sl<ChildApiService>()));


  // cubits
  sl.registerFactory(()=>LoginCubit(sl<LoginRepo>()));
  sl.registerFactory(() => GeneralRegisterCubit());
  sl.registerFactory(() => RegisterCubit(registerRepo: sl<RegisterRepo>(), govCatRepo: sl<GovCatRepo>()));
  sl.registerFactory(() => ForgetPasswordCubit(sl<ForgetPasswordRepo>()));

  sl.registerFactory(()=>CreateAdCubit(govCatRepo: sl<GovCatRepo>()));
  sl.registerFactory(()=>PaymentCubit(sl<PlansRepo>()));

  //repos


}

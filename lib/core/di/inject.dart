import 'package:get_it/get_it.dart';
import 'package:rizq/core/api_service/api_service.dart';
import 'package:rizq/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:rizq/features/auth/login/cubit/login_cubit.dart';
import 'package:rizq/features/auth/login/data/repo/login_repo.dart';
import 'package:rizq/features/auth/outer_screens/cubit/general_register_cubit.dart';
import 'package:rizq/features/auth/register/data/repo/register_repo.dart';
import 'package:rizq/features/auth/register/logic/register_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/payment_cubit/payment_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';



final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //services

  sl.registerLazySingleton(()=>ChildApiService());

  // repos
  sl.registerLazySingleton(()=>LoginRepo(apiService: sl<ChildApiService>()));
  sl.registerLazySingleton(()=>RegisterRepo(sl<ChildApiService>()));
  sl.registerLazySingleton(()=>ForgetPasswordRepo(sl<ChildApiService>()));


  // cubits
  sl.registerFactory(()=>LoginCubit(sl<LoginRepo>()));
  sl.registerFactory(() => GeneralRegisterCubit());
  sl.registerFactory(() => RegisterCubit(sl<RegisterRepo>()));
  sl.registerFactory(() => ForgetPasswordCubit(sl<ForgetPasswordRepo>()));


  sl.registerFactory(()=>AddAdCubit());
  sl.registerFactory(()=>PaymentCubit());

  //repos


}

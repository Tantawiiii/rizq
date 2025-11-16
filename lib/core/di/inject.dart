import 'package:get_it/get_it.dart';
import 'package:rizq/core/api_service/api_service.dart';
import 'package:rizq/features/auth/login/cubit/login_cubit.dart';
import 'package:rizq/features/auth/login/data/repo/login_repo.dart';
import 'package:rizq/features/auth/register/outer_screens/cubit/general_register_cubit.dart';
import 'package:rizq/features/auth/register/personal/logic/personal_register_cubit.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';



final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(()=>ChildApiService());

  // repos

  sl.registerLazySingleton(()=>LoginRepo(apiService: sl<ChildApiService>()));

  // cubits
  sl.registerFactory(()=>LoginCubit(sl<LoginRepo>()));
  sl.registerFactory(() => GeneralRegisterCubit());
  sl.registerFactory(() => PersonalRegisterCubit());
  sl.registerFactory(() => SellerRegisterCubit());

  //repos


}

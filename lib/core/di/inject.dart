import 'package:get_it/get_it.dart';
import 'package:rizq/features/auth/register/outer_screens/cubit/general_register_cubit.dart';
import 'package:rizq/features/auth/register/personal/logic/personal_register_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';



final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // cubits
  sl.registerFactory(() => GeneralRegisterCubit());
  sl.registerFactory(() => PersonalRegisterCubit());

  //repos


}

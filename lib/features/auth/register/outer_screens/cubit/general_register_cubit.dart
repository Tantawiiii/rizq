import 'package:bloc/bloc.dart';
import 'package:rizq/core/enums/enums.dart';

import 'general_register_states.dart';

final class GeneralRegisterCubit extends Cubit<GeneralRegisterStates> {
  GeneralRegisterCubit() : super(GeneralRegisterInitialState());

  UserRole? userRole;
  void changeUserRole(UserRole role) {
    userRole = role;
    emit(GeneralRegisterUserRoleChangedState());
    role.cacheUserRole();
  }

  RegisterMethod? registerMethod;
  void changeRegisterMethod(RegisterMethod method) {
    registerMethod = method;
    emit(GeneralRegisterMethodChanged());
  }
}

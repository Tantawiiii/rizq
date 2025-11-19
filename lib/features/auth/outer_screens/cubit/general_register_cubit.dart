import 'package:bloc/bloc.dart';
import 'package:rizq/core/enums/enums.dart';

import 'general_register_states.dart';

final class GeneralRegisterCubit extends Cubit<GeneralRegisterStates> {
  GeneralRegisterCubit() : super(GeneralRegisterInitialState());

  UserRole? _userRole;
  void changeUserRole(UserRole role) {
    _userRole = role;
    emit(GeneralRegisterUserRoleChangedState());
    role.cacheUserRole();
  }

  RegisterMethod? registerMethod;
  void changeRegisterMethod(RegisterMethod method) {
    registerMethod = method;
    emit(GeneralRegisterMethodChanged());
  }

  UserRole get userRole => _userRole??= UserRole.getCachedUserRole();


}

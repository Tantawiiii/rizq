import 'package:bloc/bloc.dart';
import 'package:rizq/core/enums/enums.dart';

import 'general_register_states.dart';

final class GeneralRegisterCubit extends Cubit<GeneralRegisterStates> {
  GeneralRegisterCubit() : super(GeneralRegisterInitialState());

  static UserRole? _userRole ;

  void changeUserRole(UserRole role) {
    _userRole = role;
    emit(GeneralRegisterUserRoleChangedState());
  }

  static RegisterMethod? _registerMethod;
  void changeRegisterMethod(RegisterMethod method) {
    _registerMethod = method;
    emit(GeneralRegisterMethodChanged());
  }

  UserRole? get userRole => _userRole ;
  RegisterMethod? get registerMethod => _registerMethod ;

}

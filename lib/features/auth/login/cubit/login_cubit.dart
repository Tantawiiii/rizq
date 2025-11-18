import 'package:bloc/bloc.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/custom_snack_bar.dart';
import 'package:rizq/features/auth/login/data/models/login_request_model.dart';
import 'package:rizq/features/auth/login/data/repo/base_login_repo.dart';
import 'package:rizq/features/home/main_screen.dart';

import 'login_states.dart';

final class LoginCubit extends Cubit<LoginStates> {
  BaseLoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitialState());

  void login({required LoginRequestModel loginModel}) async {
    emit(LoginLoadingState());
    var result = await loginRepo.login(model: loginModel);
    result.fold(
      (failure) {
        emit(LoginErrorState());
        showCustomSnackBar(message: failure.errMessage);
      },
      (response) {
        emit(LoginSuccessfulState());
        RouteManager.navigateAndPopAll(MainScreen());
      },
    );
  }
}

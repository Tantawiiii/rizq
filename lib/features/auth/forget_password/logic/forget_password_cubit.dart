import 'package:bloc/bloc.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/custom_snack_bar.dart';
import 'package:rizq/features/auth/forget_password/data/models/reser_password_request_model.dart';
import 'package:rizq/features/auth/forget_password/data/repo/base_forget_password_repo.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_states.dart';
import 'package:rizq/features/auth/forget_password/ui/otp_screen.dart';
import 'package:rizq/features/auth/forget_password/ui/successful_password_reset_screen.dart';

final class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit(this._repo) : super(ForgetPasswordInitialState());
  BaseForgetPasswordRepo _repo;

  void sendOtp({required String email}) async {
    emit(ForgetPasswordLoadingState());
    var result = await _repo.sendForgetPasswordOtp(email: email);
    result.fold(
      (failure) {
        emit(ForgetPasswordFailureState(message: failure.errMessage));
        showCustomSnackBar(message: failure.errMessage);
      },
      (response) {
        emit(ForgetPasswordSuccessState());
        RouteManager.navigateTo(OtpScreen(email : email));
      },
    );
  }

  void resetPassword({

    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) async {
    emit(ForgetPasswordLoadingState());
    var result = await _repo.resetPassword(
      model: resetPasswordRequestModel);
    result.fold(
      (failure) {
        emit(ForgetPasswordFailureState(message: failure.errMessage));
        showCustomSnackBar(message: failure.errMessage);
      },
      (response) {
        emit(ForgetPasswordSuccessState());
        RouteManager.navigateTo(SuccessfulPasswordResetScreen());
      },
    );
  }
}

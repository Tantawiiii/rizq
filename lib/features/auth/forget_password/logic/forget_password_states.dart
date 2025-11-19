sealed class ForgetPasswordStates {}

final class ForgetPasswordInitialState extends ForgetPasswordStates {}
final class ForgetPasswordLoadingState extends ForgetPasswordStates {}
final class ForgetPasswordSuccessState extends ForgetPasswordStates {}
final class ForgetPasswordFailureState extends ForgetPasswordStates {
  final String message;
  ForgetPasswordFailureState({required this.message});
}
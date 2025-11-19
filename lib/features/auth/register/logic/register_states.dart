sealed class RegisterStates {}
final class RegisterInitialState extends RegisterStates {}

final class RegisterLoadingState extends RegisterStates {}
final class RegisterUploadingStateChanged extends RegisterStates {
  final double progress;

  RegisterUploadingStateChanged(this.progress);
}

final class RegisterSuccessState extends RegisterStates {}

final class RegisterFailureState extends RegisterStates {
  final String errorMessage;

  RegisterFailureState(this.errorMessage);
}
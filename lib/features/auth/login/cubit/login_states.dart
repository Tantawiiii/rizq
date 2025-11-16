sealed class LoginStates {}

final class LoginInitialState extends LoginStates{}

final class LoginSuccessfulState extends LoginStates{}

final class LoginLoadingState extends LoginStates{}

final class LoginErrorState extends LoginStates{}

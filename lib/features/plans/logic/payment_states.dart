sealed class PaymentStates {}

final class PaymentInitialState extends PaymentStates {}

final class PaymentMethodChangedState extends PaymentStates {}
final class PaymentSliverBarToggleState extends PaymentStates {}

final class PaymentGettingDataState extends PaymentStates {}
final class PaymentGotDataSuccessState extends PaymentStates {}
final class PaymentGotDataFailureState extends PaymentStates {
  final String errorMessage;
  PaymentGotDataFailureState(this.errorMessage);
}



import 'package:bloc/bloc.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/features/plans/logic/payment_states.dart';

final class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit():super(PaymentInitialState()) ;

  PaymentMethod? selectedPaymentMethod;
  static bool isTopSliverShown = true;

  void changePaymentMethod(PaymentMethod method){
    selectedPaymentMethod = method;
    emit(PaymentMethodChangedState());
  }

  void toggleSliverBarVisibility(bool isShown){
    isTopSliverShown = isShown;
    emit(PaymentSliverBarToggleState());
  }


}
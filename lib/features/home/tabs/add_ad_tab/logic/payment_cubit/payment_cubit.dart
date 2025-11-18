import 'package:bloc/bloc.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/payment_cubit/payment_states.dart';

final class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit():super(PaymentInitialState()) ;

  PaymentMethod? selectedPaymentMethod;

  void changePaymentMethod(PaymentMethod method){
    selectedPaymentMethod = method;
    emit(PaymentMethodChangedState());
  }
}
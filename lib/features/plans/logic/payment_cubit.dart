import 'package:bloc/bloc.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/features/plans/data/models/bouquet_model.dart';
import 'package:rizq/features/plans/data/repo/base_plans_repo.dart';
import 'package:rizq/features/plans/logic/payment_states.dart';

final class PaymentCubit extends Cubit<PaymentStates>{


  BasePlansRepo _plansRepo;
  PaymentCubit(this._plansRepo):super(PaymentInitialState()) ;

  PaymentMethod? selectedPaymentMethod;
  static bool isTopSliverShown = true;
  List<BouquetModel> subscriptionBouquets = [];
  void changePaymentMethod(PaymentMethod method){
    selectedPaymentMethod = method;
    emit(PaymentMethodChangedState());
  }

  void toggleSliverBarVisibility(bool isShown){
    isTopSliverShown = isShown;
    emit(PaymentSliverBarToggleState());
  }

  void getSubscriptionBouquets()async{
    emit(PaymentGettingDataState());

    var result = await _plansRepo.getSubscriptionBouquets();
    result.fold(
      (failure) {
        emit(PaymentGotDataFailureState(failure.errMessage));
      },
      (bouquets) {
        subscriptionBouquets = bouquets;
        emit(PaymentGotDataSuccessState());
      });

  }



}
import 'package:bloc/bloc.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/sliding_button.dart';
import 'package:rizq/generated/locale_keys.g.dart';

import 'add_ad_states.dart';

final class AddAdCubit extends Cubit<AddAdStates>{
  AddAdCubit():super(AddAdInitialState());

  // all of this data will be fetched from the back but not now(just for testing)
  List<String> syriaStatesKeys = [
    LocaleKeys.governorates_damascus,
    LocaleKeys.governorates_aleppo,
    LocaleKeys.governorates_as_suwayda,
    LocaleKeys.governorates_daraa,
    LocaleKeys.governorates_deir_ez_zor,
    LocaleKeys.governorates_hama,
    LocaleKeys.governorates_hasakah,
    LocaleKeys.governorates_homs,
    LocaleKeys.governorates_idlib,
    LocaleKeys.governorates_latakia,
    LocaleKeys.governorates_quneitra,
    LocaleKeys.governorates_raqqa,
    LocaleKeys.governorates_rif_dimashq,
    LocaleKeys.governorates_tartous,
  ];
  String? selectedState;

  String? contactWay;
  List<String> contactWayKeys = [
    LocaleKeys.createAd_phoneCall,
    LocaleKeys.createAd_smsMessages,
  ];

  String? priceType;
  List<String> priceTypeKeys = [
    LocaleKeys.createAd_staticPrice,
    LocaleKeys.createAd_negotiatablePrice,
    LocaleKeys.createAd_auctionPrice,
  ];

  void stateChanged(String key){
    selectedState = key;
  }
  
  AdAction adAction = AdAction.subscribeInBouquet;
  
  void changeAdAction(AdAction newAction){
    adAction = newAction;
    emit(AddAdActionChangedState());
  }

}
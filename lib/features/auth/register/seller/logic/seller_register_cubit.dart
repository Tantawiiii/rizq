import 'package:bloc/bloc.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_states.dart';
import 'package:rizq/generated/locale_keys.g.dart';

final class SellerRegisterCubit extends Cubit<SellerRegisterStates>{

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

  List<String> commercialActivityKeys=[
    LocaleKeys.commercialActivity_buildings,
    LocaleKeys.commercialActivity_cars,
    LocaleKeys.commercialActivity_clothes,
    LocaleKeys.commercialActivity_electronics,
  ];
  String? selectedCommercialActivity;

  SellerRegisterCubit():super(SellerRegisterInitialState());

  void stateChanged(String key){
    selectedState = key;
  }

  void commercialActivityChanged(String key){
    selectedCommercialActivity = key;
  }

}
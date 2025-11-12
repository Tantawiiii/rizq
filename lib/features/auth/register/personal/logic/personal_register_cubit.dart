import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rizq/features/auth/register/personal/logic/personal_register_states.dart';
import 'package:rizq/generated/locale_keys.g.dart';

final class PersonalRegisterCubit extends Cubit<PersonalRegisterStates>{

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

  PersonalRegisterCubit():super(PersonalRegisterInitialState());

  void stateChanged(String s){
    final index = syriaStatesKeys.indexWhere((k) => tr(selectedState?? "") == s);
    if (index != -1) {
      selectedState = syriaStatesKeys[index];
      emit(PersonalRegisterStateChanged());
    }
  }

}
import 'package:bloc/bloc.dart';
import 'package:rizq/features/auth/register/data/models/category_model.dart';
import 'package:rizq/features/auth/register/data/models/governorate_model.dart';
import 'package:rizq/features/auth/register/data/repo/gov_cat_repo/gov_cat_repo.dart';
import 'package:rizq/generated/locale_keys.g.dart';

import 'create_ad_states.dart';


final class CreateAdCubit extends Cubit<CreateAdStates>{

  GovCatRepo govCatRepo;
  CreateAdCubit({required this.govCatRepo}):super(CreateAdInitialState());

  //TODO: variables


  List<CategoryModel> categories = [];
  static bool isTopSliverShown = true;

 List<GovernorateModel> governorates = [];
 String? selectedGov;

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

  // TODO: end of variables

  void getCategories()async{
    emit(CreateAdGettingDataState());
    var result = await govCatRepo.getCategories();
    result.fold((failure){
      emit(CreateAdGetDataFailureState(errorMessage: failure.errMessage));
    }, (cats){
      categories = cats;
      emit(CreateAdGotDataState());
    });
  }
  void getGovernorates()async{
    emit(CreateAdGettingDataState());
    var result = await govCatRepo.getGovernorates();
    result.fold((failure){
      emit(CreateAdGetDataFailureState(errorMessage: failure.errMessage));
    }, (govs){
      governorates = govs;
      emit(CreateAdGotDataState());
    });
  }


  // TODO: AD IMAGES

  // ad images management will be here
 List<String> adImages = List.generate(6, (i)=>'');

  void changeAdImages(String imagePath, int index){
    adImages[index] = imagePath;
   emit(CreateAdChangedImagesState());
  }

  double filledImagePercent(){
    int filledImagesCount = adImages.where((imagePath) => imagePath.isNotEmpty).length;
    return (filledImagesCount / adImages.length);
  }
  

}
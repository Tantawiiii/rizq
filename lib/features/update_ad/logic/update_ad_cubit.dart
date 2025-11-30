import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rizq/features/auth/register/data/models/category_model.dart';
import 'package:rizq/features/auth/register/data/models/governorate_model.dart';
import 'package:rizq/features/auth/register/data/repo/gov_cat_repo/gov_cat_repo.dart';
import 'package:rizq/generated/locale_keys.g.dart';

import 'update_ad_states.dart';


final class UpdateAdCubit extends Cubit<UpdateAdStates>{

  GovCatRepo govCatRepo;
  UpdateAdCubit({required this.govCatRepo}):super(UpdateAdInitialState());

  //TODO: variables


  List<CategoryModel> categories = [];
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
    emit(UpdateAdGettingDataState());
    var result = await govCatRepo.getCategories();
    result.fold((failure){
      emit(UpdateAdGetDataFailureState(errorMessage: failure.errMessage));
    }, (cats){
      categories = cats;
      emit(UpdateAdGotDataState());
    });
  }
  void getGovernorates()async{
    emit(UpdateAdGettingDataState());
    var result = await govCatRepo.getGovernorates();
    result.fold((failure){
      emit(UpdateAdGetDataFailureState(errorMessage: failure.errMessage));
    }, (govs){
      governorates = govs;
      emit(UpdateAdGotDataState());
    });
  }


  // TODO: AD IMAGES

  // ad images management will be here
 List<String> adImages = [
   'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
   'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
   'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
 ];

  void removeFromAdImages(int index){
    adImages.removeAt(index);

   emit(UpdateAdChangedImagesState());
  }

  void assignNewImageList(List<String> imagePaths){

    adImages = imagePaths.take(6).toList();
    emit(UpdateAdChangedImagesState());
  }

  void pickImageAgain()async{
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      adImages.add(result.paths.first!);
      emit(UpdateAdChangedImagesState());
    }
  }

}
import 'package:dio/dio.dart';

final class RegisterRequestModel {
  String username;
  String email;
  String password;
  String phone;
  int governorateId;
  String accountType;

  LocalizedName? storeName;

  int? interestedCategoryId;
  String? storeOrCompanyLogo;
  double? latitude;
  double? longitude;
  String? commercialRegisterNumber;
  LocalizedName? businessAddress;
  String? websiteLink;
  String? identityDocumentFilePath;
  String? proofOfOwnershipFilePath;

  RegisterRequestModel({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.governorateId,
    required this.accountType,
    this.storeName,
    this.businessAddress,
    this.interestedCategoryId,
    this.storeOrCompanyLogo,
    this.latitude,
    this.longitude,
    this.commercialRegisterNumber,
    this.websiteLink,
    this.proofOfOwnershipFilePath,
    this.identityDocumentFilePath,
  });

  FormData toFrmData() {
    return FormData.fromMap({
      'name': username,
      'email': email,
      'password': password,
      'phone': phone,
      'governorate_id': governorateId,
      'account_guard': accountType,
      if (storeName != null) 'store_name': storeName!.toMap(),
      if (interestedCategoryId != null) 'category_id': interestedCategoryId,
      if (storeOrCompanyLogo != null)
        'logo': MultipartFile.fromFileSync(
          storeOrCompanyLogo!,
          filename: storeOrCompanyLogo!.split('/').last,
        ),
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (commercialRegisterNumber != null)
        'commercial_register': commercialRegisterNumber,
      if (businessAddress != null) 'business_address': businessAddress!.toMap(),
      if (websiteLink != null) 'website': websiteLink,
      if (proofOfOwnershipFilePath != null)
        'proof_of_ownership_document': MultipartFile.fromFileSync(
          proofOfOwnershipFilePath!,
          filename: proofOfOwnershipFilePath!.split('/').last,
        ),
      if (identityDocumentFilePath != null)
        'photo_of_personal_ID': MultipartFile.fromFileSync(
          identityDocumentFilePath!,
          filename: identityDocumentFilePath!.split('/').last,
        ),

      // TODO: BACK STILL DOESN'T ACCEPT ALL OF THE DATA
    });
  }
}

final class LocalizedName {
  String ar;
  String en;

  LocalizedName({required this.ar, required this.en});

  Map<String, dynamic> toMap() {
    return {'ar': ar, 'en': en};
  }
}

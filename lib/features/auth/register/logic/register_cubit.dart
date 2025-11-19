import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/custom_snack_bar.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/forget_password/ui/otp_screen.dart';
import 'package:rizq/features/auth/outer_screens/ui/successful_register_screen.dart';
import 'package:rizq/features/auth/register/data/models/register_request_model.dart';
import 'package:rizq/features/auth/register/data/repo/base_register_repo.dart';
import 'package:rizq/features/auth/register/logic/register_states.dart';

final class RegisterCubit extends Cubit<RegisterStates> {
  final BaseRegisterRepo registerRepo;

  final nameController = TextEditingController(text: kDebugMode ? 'ali' : '');
  final emailController = TextEditingController(
    text: kDebugMode ? 'ali@dev.com' : '',
  );
  final phoneController = TextEditingController(
    text: kDebugMode ? '01283416030' : '',
  );
  final passwordController = TextEditingController(
    text: kDebugMode ? 'Aa123456' : '',
  );
  final passwordConfirmController = TextEditingController(
    text: kDebugMode ? 'Aa123456' : '',
  );

  String? governorateKey;
  String? activityKey;

  final shopNameController = TextEditingController(
    text: kDebugMode ? "Rizq Store" : "",
  );
  final commercialAddressController = TextEditingController(
    text: kDebugMode ? "Alexandria-Nozha" : "",
  );
  final addressLinkController = TextEditingController(
    text: kDebugMode ? "https://www.google.com/maps/place/30%C2%B031'19.1%22N+30%C2%B054'10.6%22E/@30.5219686,30.9054996,17z/data=!3m1!4b1!4m4!3m3!8m2!3d30.521964!4d30.90293?entry=ttu&g_ep=EgoyMDI1MTExNy4wIKXMDSoASAFQAw%3D%3D" : "",
  );
  final registrationNoController = TextEditingController(
    text: kDebugMode ? "42566" : "",
  );
  final webSiteLinkController = TextEditingController(
    text: kDebugMode ? "https://www.rar-it.com" : "",
  );
  final descriptionController = TextEditingController(
    text: kDebugMode ? "Short Description for Rizq Store" : "",
  );

  // for company social media (backend still doesn't support these fields)
  final facebookLinkController = TextEditingController(
    text: kDebugMode ? "https://www.facebook.com/rizq" : "",
  );
  final whatsAppLinkController = TextEditingController(
    text: kDebugMode ? "https://www.wa.me/+201283416030" : "",
  );
  final instagramLinkController = TextEditingController(
    text: kDebugMode ? "https://www.instagram.com/rizq" : "",
  );
  final linkedInLinkController = TextEditingController(
    text: kDebugMode ? "https://www.linkedin.com/rizq" : "",
  );

  String? shopLogoFilePath;
  String? idFilePath;
  String? ownershipFilePath;

  RegisterCubit(this.registerRepo) : super(RegisterInitialState());

  void registerUser() async {
    UserRole role = UserRole.getCachedUserRole();

    emit(RegisterLoadingState());

    final registerRequestModel = RegisterRequestModel(
      username: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      accountType: role.name,
      governorateId: 1,
      interestedCategoryId: role.isNormal ? null : 1,
      storeName: role.isNormal ? null : LocalizedName(ar: shopNameController.text, en: shopNameController.text),
      storeOrCompanyLogo: role.isNormal ? null : shopLogoFilePath,
      commercialRegisterNumber: role.isNormal ? null : idFilePath,
      proofOfOwnershipFilePath: role.isNormal ? null : ownershipFilePath,
      latitude: role.isNormal || addressLinkController.text.isEmpty ? null : addressLinkController.text.extractCoordinates!['lat'],
      longitude: role.isNormal || addressLinkController.text.isEmpty ? null : addressLinkController.text.extractCoordinates!['lon'],
      businessAddress: role.isNormal
          ? null
          : LocalizedName(ar: commercialAddressController.text, en: commercialAddressController.text),

      websiteLink: role.isNormal ? null : webSiteLinkController.text,
      identityDocumentFilePath: role.isNormal ? null : idFilePath,
    );

    final result = await registerRepo.registerUser(
      registerRequestModel: registerRequestModel,
      onSendProgress: (percent, total) {
        double progress = percent / total;
        emit(RegisterUploadingStateChanged(progress));
      },
    );

    result.fold(
      (failure) {
        showCustomSnackBar(message: failure.errMessage);
        emit(RegisterFailureState(failure.errMessage));
      },
      (response) {
        emit(RegisterSuccessState());
        RouteManager.navigateTo(SuccessfulRegisterScreen());
      },
    );
  }
}

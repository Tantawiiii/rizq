import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/rizq_app.dart';
import 'core/di/inject.dart';
import 'features/notifications/services/notification_service.dart';
import 'generated/locale_keys.g.dart';

// // Background message handler (must be top-level function)
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Background message received: ${message.messageId}');
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
   // await Firebase.initializeApp();

    // Initialize Easy Localization
    await EasyLocalization.ensureInitialized();

    // Initialize dependency injection
    await init();
    //FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Initialize notification service
    // try {
    //   await NotificationService().initialize();
    // } catch (e) {
    //   print('Error initializing NotificationService: $e');
    //   // Continue even if notification service fails to initialize
    // }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //TODO: JUST FOR TESTING
    UserRole.normal.cacheUserRole();

    runApp(const RizqApp());
}

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
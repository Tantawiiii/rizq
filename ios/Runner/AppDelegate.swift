import UIKit
import Flutter
import GoogleMaps
import FirebaseCore
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // Firebase
    FirebaseApp.configure()

    // Google Maps
    GMSServices.provideAPIKey("AIzaSyADqzA9TBSpZsHA7N59QRfFbclhNLcl7AQ")

    // Notifications
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
      UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert, .badge, .sound],
        completionHandler: { _, _ in }
      )
    }

    application.registerForRemoteNotifications()

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


// import Flutter
// import UIKit
// import GoogleMaps
// import FirebaseCore
// import UserNotifications
//
// @main
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     // Initialize Firebase
//
//     FirebaseApp.configure()
//
//     // Initialize Google Maps SDK before Flutter engine
//     GMSServices.provideAPIKey("AIzaSyADqzA9TBSpZsHA7N59QRfFbclhNLcl7AQ")
//
//     // Request notification permissions
//     if #available(iOS 10.0, *) {
//       UNUserNotificationCenter.current().delegate = self
//       let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//       UNUserNotificationCenter.current().requestAuthorization(
//         options: authOptions,
//         completionHandler: { _, _ in }
//       )
//     } else {
//       let settings: UIUserNotificationSettings =
//         UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//       application.registerUserNotificationSettings(settings)
//     }
//     application.registerForRemoteNotifications()
//
//     // Register plugins
//     GeneratedPluginRegistrant.register(with: self)
//
//     // Call super to initialize Flutter engine
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
//
//   // Handle APNS token
//   override func application(_ application: UIApplication,
//                             didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//     // Pass device token to Firebase Messaging
//     // This is handled automatically by Firebase Messaging plugin
//   }
//
//   override func application(_ application: UIApplication,
//                             didFailToRegisterForRemoteNotificationsWithError error: Error) {
//     print("Failed to register for remote notifications: \(error)")
//   }
// }
import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Initialize Google Maps SDK before Flutter engine
    GMSServices.provideAPIKey("AIzaSyADqzA9TBSpZsHA7N59QRfFbclhNLcl7AQ")
    
    // Register plugins
    GeneratedPluginRegistrant.register(with: self)
    
    // Call super to initialize Flutter engine
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
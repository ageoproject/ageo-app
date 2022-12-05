import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//      GMSServices.provideAPIKey(Bundle.main.infoDictionary?["GOOGEL_MAP_API_KEY"] as! String)
      GMSServices.provideAPIKey("AIzaSyA4q5aXIxVMxugD7As9BYbywFmwm5hX21A")
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

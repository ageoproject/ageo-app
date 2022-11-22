import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      print("This is my Google Api key => ");
      print(Bundle.main.infoDictionary?["GOOGEL_MAP_API_KEY"] as! String);
      GMSServices.provideAPIKey(Bundle.main.infoDictionary?["GOOGEL_MAP_API_KEY"] as! String)
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey(Bundle.main.infoDictionary?["GOOGLE_MAP_API_KEY"] as! String)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

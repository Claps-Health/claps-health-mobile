import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
   let channelName = "com.clapsHealth.dev/genKeyPair"
   let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
   let myMethodChannel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)
   myMethodChannel.setMethodCallHandler({(call: FlutterMethodCall, result: FlutterResult) -> Void in
       let args = call.arguments as? NSDictionary
       switch call.method {
        case "getKeyPair":
           let mnemonic = args!["mnemonic"] as! String
           result(generateKeys(mnemonic: mnemonic))
           break
           
        case "signMessage":
           let message = args!["message"] as! String
           let privateKey = args!["privateKey"] as! String
           let signature = signTheMessage(message: message, privateKey: privateKey)
           result(signature)
           break
               
        default: result(FlutterMethodNotImplemented)
           break
               
       }
   })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

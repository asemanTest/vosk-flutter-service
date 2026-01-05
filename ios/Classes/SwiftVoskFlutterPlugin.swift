import Flutter
import UIKit

public class VoskFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "vosk_flutter", binaryMessenger: registrar.messenger())
    let instance = VoskFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(FlutterMethodNotImplemented)
  }
}

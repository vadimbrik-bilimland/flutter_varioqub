import Flutter
import UIKit
import YandexMobileMetrica
import Varioqub
import MetricaAdapter
import Foundation

public class FlutterVarioqubPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_varioqub", binaryMessenger: registrar.messenger())
    let instance = FlutterVarioqubPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as? NSDictionary
    switch call.method {
    case "init":
        guard let apiKey = arguments?["api_key"] as? String else {
                        result(
                            FlutterError(code: "API key = null",
                                message: nil,
                                details: nil))
                        return
                    }
        var vqCfg = VarioqubConfig.default


        VarioqubFacade.shared.initialize(apiKey: apiKey, config: vqCfg, idProvider: nil, reporter: nil)
        
        result(nil)
    case "set_default":
        guard let defaultMap = arguments?["default_map"] as? Dictionary<String, Any> else{
            result(FlutterError(code: "Default map = null", message: nil, details: nil))
            return
        }
        let jsonData = try? JSONSerialization.data(withJSONObject:defaultMap)
        if (jsonData == nil){
            result(FlutterError(code: "Default map serialization error", message: nil, details: nil))
            return
        }
        VarioqubFacade.shared.loadXml(from: jsonData! , callback: nil)
        result(nil)
    case "get_bool":
        guard let boolKey = arguments?["bool_key"] as? String else{
            result(FlutterError(code: "Key is null", message: nil, details: nil))
            return
        }
        let value = VarioqubFacade.shared.getBool(for: VarioqubFlag(rawValue: boolKey))
        result(value)
    case "get_string":
        guard let stringKey = arguments?["string_key"] as? String else{
            result(FlutterError(code: "Key is null", message: nil, details: nil))
            return
        }
        let value = VarioqubFacade.shared.getString(for: VarioqubFlag(rawValue: stringKey))
        result(value)
    case "get_double":
        guard let doubleKey = arguments?["double_key"] as? String else{
            result(FlutterError(code: "Key is null", message: nil, details: nil))
            return
        }
        let value = VarioqubFacade.shared.getDouble(for: VarioqubFlag(rawValue: doubleKey))
        result(value)
    case "get_long":
        guard let longKey = arguments?["long_key"] as? String else{
            result(FlutterError(code: "Key is null", message: nil, details: nil))
            return
        }
        let value = VarioqubFacade.shared.getInt64(for: VarioqubFlag(rawValue: longKey))
        result(value)
    case "get_id":
        let id = VarioqubFacade.shared.varioqubId
        result(id)
    case "fetch_config":
        VarioqubFacade.shared.fetchConfig({ status in
         switch status {
           case .success: result(nil)
           case .throttled, .cached: result(nil)
         case .error(let e): result(FlutterError(code:"\(e)", message:nil, details:nil))
         @unknown default:
             result(FlutterError(code: "Unknown error fetch config", message: nil, details: nil))
         }
        })
    case "activate_config":
        VarioqubFacade.shared.activateConfigAndWait()
        result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

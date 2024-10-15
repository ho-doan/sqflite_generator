import Flutter
import UIKit

public class SqlExternalDbPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sql_external_db", binaryMessenger: registrar.messenger())
    let instance = SqlExternalDbPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "externalPath":
        let groupBundle = call.arguments as! String
        let args = groupBundle.components(separatedBy: "//")
        let path = getSharedDatabasePath(args[0], db: args[1])
        #if DEBUG
        print("sharedDatabasePath == \(String(describing: path))")
        #endif
      result(path)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    func getSharedDatabasePath(_ groupBundle: String, db :String) -> String? {
        if let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupBundle) {
            let dbPath = containerURL.appendingPathComponent(db).path
            return dbPath
        }
        return nil
    }
}

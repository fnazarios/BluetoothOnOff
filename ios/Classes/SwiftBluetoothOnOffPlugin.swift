import Flutter
import UIKit
import CoreBluetooth

public class SwiftBluetoothOnOffPlugin: NSObject, FlutterPlugin {
    
    private lazy var manager: CBCentralManager = {
        CBCentralManager(delegate: self, queue: nil)
    }()
    
    private var flutterResult: FlutterResult?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "BluetoothOnOff", binaryMessenger: registrar.messenger())
        let instance = SwiftBluetoothOnOffPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        print("[Bluetooth OnOff] method \(call.method)")
        
        switch call.method {
        case "turnOnBluetooth":
            _ = manager.state
            
            flutterResult = result
        case "turnOffBluetooth":
            result(0)
        default:
            result(0)
        }
    }
}

extension SwiftBluetoothOnOffPlugin: CBCentralManagerDelegate {
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            flutterResult?(1)
        default:
            break
        }
    }
}

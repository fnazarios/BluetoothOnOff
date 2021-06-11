#import "BluetoothOnOffPlugin.h"
#if __has_include(<BluetoothOnOff/BluetoothOnOff-Swift.h>)
#import <BluetoothOnOff/BluetoothOnOff-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "BluetoothOnOff-Swift.h"
#endif

@implementation BluetoothOnOffPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBluetoothOnOffPlugin registerWithRegistrar:registrar];
}
@end

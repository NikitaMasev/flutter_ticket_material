#import "TicketMaterialPlugin.h"
#if __has_include(<ticket_material/ticket_material-Swift.h>)
#import <ticket_material/ticket_material-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ticket_material-Swift.h"
#endif

@implementation TicketMaterialPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTicketMaterialPlugin registerWithRegistrar:registrar];
}
@end

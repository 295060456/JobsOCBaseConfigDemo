#import <UIKit/UIKit.h>
#import "VIPER/VIPERLoginProtocols.h"
@interface VIPERLoginRouterImpl : NSObject <VIPERLoginRouter>
+ (UIViewController *)buildModule;
@end

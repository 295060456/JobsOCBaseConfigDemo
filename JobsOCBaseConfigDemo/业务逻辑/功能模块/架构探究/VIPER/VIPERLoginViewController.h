#import <UIKit/UIKit.h>
#import "VIPER/VIPERLoginProtocols.h"
@interface VIPERLoginViewController : UIViewController <VIPERLoginView>
@property (nonatomic, strong) id<VIPERLoginPresenter> presenter;
@end

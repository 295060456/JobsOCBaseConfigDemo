#import <Foundation/Foundation.h>
#import "VIPER/VIPERLoginProtocols.h"
@interface VIPERLoginPresenterImpl : NSObject <VIPERLoginPresenter, VIPERLoginInteractorOutput>
@property (nonatomic, weak) id<VIPERLoginView> view;
@property (nonatomic, strong) id<VIPERLoginInteractorInput> interactor;
@property (nonatomic, strong) id<VIPERLoginRouter> router;
@end

#import <Foundation/Foundation.h>
#import "VIPER/VIPERLoginProtocols.h"
@protocol AuthService;
@interface VIPERLoginInteractor : NSObject <VIPERLoginInteractorInput>
@property (nonatomic, weak) id<VIPERLoginInteractorOutput> output;
- (instancetype)initWithService:(id<AuthService>)service;
@end

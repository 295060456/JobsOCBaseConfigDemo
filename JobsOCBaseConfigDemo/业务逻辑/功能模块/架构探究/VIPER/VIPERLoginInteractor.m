#import "VIPERLoginInteractor.h"
#import "Common/AuthService.h"
#import "Common/UserCredential.h"
@interface VIPERLoginInteractor ()
@property (nonatomic, strong) id<AuthService> service;
@end
@implementation VIPERLoginInteractor
- (instancetype)initWithService:(id<AuthService>)service { if (self=[super init]){_service=service;} return self; }
- (void)loginWith:(UserCredential *)cred {
    __weak typeof(self) w = self;
    [self.service loginWithUsername:cred.username password:cred.password completion:^(BOOL success, NSString * _Nullable message) {
        if (success) [w.output loginSucceededWithMessage:(message ?: @"OK")];
        else [w.output loginFailedWithMessage:(message ?: @"失败")];
    }];
}
@end

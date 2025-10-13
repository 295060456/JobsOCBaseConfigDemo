#import "MVVMLoginViewModel.h"
@interface MVVMLoginViewModel ()
@property (nonatomic, strong) id<AuthService> service;
@end
@implementation MVVMLoginViewModel
- (instancetype)initWithService:(id<AuthService>)service {
    if (self = [super init]) { _service = service; }
    return self;
}
- (void)setUsername:(NSString *)username { _username = username ?: @""; [self emitEnabled]; }
- (void)setPassword:(NSString *)password { _password = password ?: @""; [self emitEnabled]; }
- (void)emitEnabled {
    BOOL ok = (_username.length >= 3 && _password.length >= 6);
    if (self.loginEnabledChanged) self.loginEnabledChanged(ok);
}
- (void)login {
    if (self.loadingChanged) self.loadingChanged(YES);
    __weak typeof(self) w = self;
    [self.service loginWithUsername:self.username password:self.password completion:^(BOOL success, NSString * _Nullable message) {
        if (w.loadingChanged) w.loadingChanged(NO);
        if (w.messageChanged) w.messageChanged(message ?: (success?@"OK":@"失败"), success);
    }];
}
@end

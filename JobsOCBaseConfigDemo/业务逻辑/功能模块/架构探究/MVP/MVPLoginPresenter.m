#import "MVPLoginPresenter.h"
#import "Common/AuthService.h"
@interface MVPLoginPresenterImpl ()
@property (nonatomic, weak) id<MVPLoginView> view;
@property (nonatomic, strong) id<AuthService> service;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@end
@implementation MVPLoginPresenterImpl
- (instancetype)initWithView:(id<MVPLoginView>)view service:(id<AuthService>)service {
    if (self = [super init]) { _view = view; _service = service; }
    return self;
}
- (void)viewDidLoad { [self.view setLoginEnabled:NO]; }
- (void)onUsernameChanged:(NSString *)username { _username = username ?: @""; [self validate]; }
- (void)onPasswordChanged:(NSString *)password { _password = password ?: @""; [self validate]; }
- (void)validate {
    BOOL ok = (self.username.length >= 3 && self.password.length >= 6);
    [self.view setLoginEnabled:ok];
}
- (void)onTapLogin {
    [self.view showLoading:YES];
    __weak typeof(self) w = self;
    [self.service loginWithUsername:self.username password:self.password completion:^(BOOL success, NSString * _Nullable message) {
        [w.view showLoading:NO];
        [w.view showMessage:(message ?: (success ? @"OK" : @"失败")) success:success];
    }];
}
@end

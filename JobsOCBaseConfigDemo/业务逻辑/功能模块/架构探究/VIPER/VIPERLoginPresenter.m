#import "VIPERLoginPresenter.h"
#import "Common/UserCredential.h"
#import <UIKit/UIKit.h>
@interface VIPERLoginPresenterImpl ()
@property (nonatomic, copy) NSString *u;
@property (nonatomic, copy) NSString *p;
@end
@implementation VIPERLoginPresenterImpl
- (void)viewDidLoad { [self.view setLoginEnabled:NO]; }
- (void)usernameChanged:(NSString *)u { _u = u?:@""; [self validate]; }
- (void)passwordChanged:(NSString *)p { _p = p?:@""; [self validate]; }
- (void)validate { [self.view setLoginEnabled:(_u.length>=3 && _p.length>=6)]; }
- (void)tapLogin {
    [self.view showLoading:YES];
    UserCredential *cred = [[UserCredential alloc] initWithUsername:self.u password:self.p];
    [self.interactor loginWith:cred];
}
#pragma mark - Interactor Output
- (void)loginSucceededWithMessage:(NSString *)msg {
    [self.view showLoading:NO];
    [self.view renderMessage:msg success:YES];
    UIViewController *vc = (UIViewController *)self.view;
    [self.router navigateToHomeFrom:vc];
}
- (void)loginFailedWithMessage:(NSString *)msg {
    [self.view showLoading:NO];
    [self.view renderMessage:msg success:NO];
}
@end

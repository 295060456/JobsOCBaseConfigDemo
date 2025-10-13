#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@protocol MVPLoginView <NSObject>
- (void)showLoading:(BOOL)loading;
- (void)showMessage:(NSString *)text success:(BOOL)ok;
- (void)setLoginEnabled:(BOOL)enabled;
@end
@protocol AuthService;
@protocol MVPLoginPresenter <NSObject>
- (instancetype)initWithView:(id<MVPLoginView>)view service:(id<AuthService>)service;
- (void)viewDidLoad;
- (void)onUsernameChanged:(NSString *)username;
- (void)onPasswordChanged:(NSString *)password;
- (void)onTapLogin;
@end
NS_ASSUME_NONNULL_END

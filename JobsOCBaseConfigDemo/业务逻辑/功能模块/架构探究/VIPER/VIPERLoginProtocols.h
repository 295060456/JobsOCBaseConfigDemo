#import <Foundation/Foundation.h>
@class UserCredential;
NS_ASSUME_NONNULL_BEGIN
@protocol VIPERLoginView <NSObject>
- (void)showLoading:(BOOL)loading;
- (void)renderMessage:(NSString *)text success:(BOOL)ok;
- (void)setLoginEnabled:(BOOL)enabled;
@end
@protocol VIPERLoginPresenter <NSObject>
- (void)viewDidLoad;
- (void)usernameChanged:(NSString *)u;
- (void)passwordChanged:(NSString *)p;
- (void)tapLogin;
@end
@protocol VIPERLoginInteractorInput <NSObject>
- (void)loginWith:(UserCredential *)cred;
@end
@protocol VIPERLoginInteractorOutput <NSObject>
- (void)loginSucceededWithMessage:(NSString *)msg;
- (void)loginFailedWithMessage:(NSString *)msg;
@end
@protocol VIPERLoginRouter <NSObject>
+ (UIViewController *)buildModule;
- (void)navigateToHomeFrom:(UIViewController *)vc;
@end
NS_ASSUME_NONNULL_END

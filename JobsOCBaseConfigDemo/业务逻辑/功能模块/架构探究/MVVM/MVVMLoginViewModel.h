#import <Foundation/Foundation.h>
#import "Common/AuthService.h"
NS_ASSUME_NONNULL_BEGIN
@interface MVVMLoginViewModel : NSObject
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) void(^loginEnabledChanged)(BOOL enabled);
@property (nonatomic, copy) void(^loadingChanged)(BOOL loading);
@property (nonatomic, copy) void(^messageChanged)(NSString *msg, BOOL success);
- (instancetype)initWithService:(id<AuthService>)service;
- (void)login;
@end
NS_ASSUME_NONNULL_END

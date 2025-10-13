#import "MockAuthService.h"
@implementation MockAuthService
- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
               completion:(AuthCompletion)completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        if ([username isEqualToString:@"admin"] && [password isEqualToString:@"123456"]) {
            completion(YES, @"登录成功，欢迎回来。");
        } else {
            completion(NO, @"账号或密码错误。");
        }
    });
}
@end

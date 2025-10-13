#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^AuthCompletion)(BOOL success, NSString * _Nullable message);
@protocol AuthService <NSObject>
- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
               completion:(AuthCompletion)completion;
@end
NS_ASSUME_NONNULL_END

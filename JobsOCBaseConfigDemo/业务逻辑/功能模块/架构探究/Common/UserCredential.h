#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface UserCredential : NSObject
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
- (instancetype)initWithUsername:(NSString *)u password:(NSString *)p;
@end
NS_ASSUME_NONNULL_END

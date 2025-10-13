#import "UserCredential.h"
@implementation UserCredential
- (instancetype)initWithUsername:(NSString *)u password:(NSString *)p {
    if (self = [super init]) { _username = u ?: @""; _password = p ?: @""; }
    return self;
}
@end

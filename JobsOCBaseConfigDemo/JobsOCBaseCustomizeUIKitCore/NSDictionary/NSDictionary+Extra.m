//
//  NSDictionary+Extra.m
//  FM
//
//  Created by User on 9/21/24.
//

#import "NSDictionary+Extra.h"

@implementation NSDictionary (Extra)

-(JobsReturnIDByIDBlock _Nonnull)objectForKey{
    @jobs_weakify(self)
    return ^(id key) {
        @jobs_strongify(self)
        id value = nil;
        if (isValue(key)) {
            @try {
                value = [self objectForKey:key];
            }
            @catch (NSException *exception) {
                NSLog(@"Exception while fetching value for key '%@': %@", key, exception);
                value = nil; // 返回 nil 或者自定义的默认值
            }
        } else {
            NSLog(@"Invalid key: '%@' does not conform to the required format.", key);
        }return value;
    };
}
/// 转成可变字典
-(JobsReturnMutableDicByVoidBlock _Nonnull)mutableDic{
    @jobs_weakify(self)
    return ^__kindof NSMutableDictionary *_Nonnull(){
        @jobs_strongify(self)
        return [NSMutableDictionary dictionaryWithDictionary:self];
    };
}

@end

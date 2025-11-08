//
//  NSDictionary+Extra.m
//  FM
//
//  Created by User on 9/21/24.
//

#import "NSDictionary+Extra.h"

@implementation NSDictionary (Extra)
/// 对系统方法 initWithContentsOfFile 的二次封装
+(JobsRetDicByStringBlock _Nonnull)initByContentsOfFile{
    return ^__kindof NSDictionary *_Nullable(__kindof NSString *_Nullable filePath){
        return [NSDictionary.alloc initWithContentsOfFile:filePath];
    };
}
/// 对系统方法 initWithContentsOfURL 的二次封装
+(JobsReturnDicByURLBlock _Nonnull)initByContentsOfURL{
    return ^__kindof NSDictionary *_Nullable(NSURL *_Nullable filePath){
        return [NSDictionary.alloc initWithContentsOfURL:filePath];
    };
}
/// 转成可变字典
-(JobsRetMutableDicByVoidBlock _Nonnull)mutableDic{
    @jobs_weakify(self)
    return ^__kindof NSMutableDictionary *_Nonnull(){
        @jobs_strongify(self)
        return [NSMutableDictionary dictionaryWithDictionary:self];
    };
}
/// 对系统方法 objectForKey 的二次封装
-(JobsRetIDByIDBlock _Nonnull)objectForKey{
    @jobs_weakify(self)
    return ^(id key) {
        @jobs_strongify(self)
        id value = nil;
        if (isValue(key)) {
            @try {
                value = [self objectForKey:key];
            }
            @catch (NSException *exception) {
                JobsLog(@"Exception while fetching value for key '%@': %@", key, exception);
                value = nil; // 返回 nil 或者自定义的默认值
            }
        } else {
            JobsLog(@"Invalid key: '%@' does not conform to the required format.", key);
        }return value;
    };
}

@end



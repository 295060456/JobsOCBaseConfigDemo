//
//  NSCoder+Extra.m
//  FM
//
//  Created by Admin on 9/11/2024.
//

#import "NSCoder+Extra.h"

@implementation NSCoder (Extra)
/// 解档：字符串类型数据
-(JobsReturnIDByStringBlock _Nonnull)decodeStringBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSString.class forKey:data];
    };
}
/// 解档：UIImage类型数据
-(JobsReturnIDByStringBlock _Nonnull)decodeImageBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:UIImage.class forKey:data];
    };
}
/// 解档：NSNumber类型数据
-(JobsReturnIDByStringBlock _Nonnull)decodeNumberBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSNumber.class forKey:data];
    };
}
/// 解档：BOOL值
-(JobsReturnBOOLByStringBlock _Nonnull)decodeBOOLBy{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeBoolForKey:data];
    };
}
/// 解档：NSInteger值
-(JobsReturnNSIntegerByStringBlock _Nonnull)decodeIntegerBy{
    @jobs_weakify(self)
    return ^NSInteger(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeIntegerForKey:data];
    };
}
/// 解档：浮点数 (double) 数据
-(JobsReturnDoubleByStringBlock _Nonnull)decodeDoubleBy{
    @jobs_weakify(self)
    return ^double(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeDoubleForKey:data];
    };
}
/// 解档：字典类型数据
-(JobsReturnIDByStringBlock _Nonnull)decodeDictionaryBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSDictionary.class forKey:data];
    };
}
/// 解档：数组类型数据
-(JobsReturnIDByStringBlock _Nonnull)decodeArrayBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSArray.class forKey:data];
    };
}
/// 解档：NSData类型数据
-(JobsReturnIDByStringBlock _Nonnull)decodeDataBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSData.class forKey:data];
    };
}


@end

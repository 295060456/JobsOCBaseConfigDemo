//
//  NSCoder+Extra.m
//  FM
//
//  Created by Admin on 9/11/2024.
//

#import "NSCoder+Extra.h"

@implementation NSCoder (Extra)
/// 解档：字符串类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeStringBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSString.class forKey:data];
    };
}
/// 解档：UIImage类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeImageBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:UIImage.class forKey:data];
    };
}
/// 解档：NSNumber类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeNumberBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSNumber.class forKey:data];
    };
}
/// 解档：BOOL值
-(JobsRetBOOLByStrBlock _Nonnull)decodeBOOLBy{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeBoolForKey:data];
    };
}
/// 解档：NSInteger值
-(JobsRetNSIntegerByStrBlock _Nonnull)decodeIntegerBy{
    @jobs_weakify(self)
    return ^NSInteger(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeIntegerForKey:data];
    };
}
/// 解档：浮点数 (double) 数据
-(JobsRetDoubleByStrBlock _Nonnull)decodeDoubleBy{
    @jobs_weakify(self)
    return ^double(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeDoubleForKey:data];
    };
}
/// 解档：字典类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeDictionaryBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSDictionary.class forKey:data];
    };
}
/// 解档：数组类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeArrayBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSArray.class forKey:data];
    };
}
/// 解档：NSData类型数据
-(JobsRetIDByStrBlock _Nonnull)decodeDataBy{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return [self decodeObjectOfClass:NSData.class forKey:data];
    };
}


@end

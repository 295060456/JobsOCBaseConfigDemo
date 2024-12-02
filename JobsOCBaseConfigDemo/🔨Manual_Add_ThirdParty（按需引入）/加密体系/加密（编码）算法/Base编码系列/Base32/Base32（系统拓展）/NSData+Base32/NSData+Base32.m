//
//  NSData+Base32.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import "NSData+Base32.h"

@implementation NSData (Base32)
#pragma mark —— NSData ==> Base32
///【类方法】将NSData对象 转换为 以Base32编码的字符串
+(JobsReturnStringByDataBlock _Nonnull)base32String{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return MF_Base32Codec.base32StringFromData(data);
    };
}
///【实例方法】将NSData对象 转换为 以Base32编码的字符串
-(NSString *_Nullable)base32String{
    return NSData.base32String(self);
}
#pragma mark —— Base32 ==> NSData
///【类方法】将Base32编码的字符串 转换为 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataWithBase32String{
    return ^NSData *_Nullable(__kindof NSString *_Nullable base32String){
        return MF_Base32Codec.dataFromBase32String(base32String);
    };
}
///【实例方法】将Base32编码的字符串 转换为 NSData对象
-(JobsReturnDataByStringBlock _Nonnull)dataWithBase32String{
    return ^NSData *_Nullable(__kindof NSString *_Nullable base32String){
        return NSData.dataWithBase32String(base32String);
    };
}

@end

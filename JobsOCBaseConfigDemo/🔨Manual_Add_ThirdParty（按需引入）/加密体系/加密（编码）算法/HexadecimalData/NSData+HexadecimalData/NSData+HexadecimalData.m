//
//  NSData+HexadecimalData.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSData+HexadecimalData.h"

@implementation NSData (HexadecimalData)
#pragma mark —— NSData对象 ==> 16进制字符串
///【类方法】NSData对象  转换为  16进制字符串
+(JobsRetStrByDataBlock _Nonnull)hexStringByData{
    return ^__kindof NSString *_Nullable(__kindof NSData *_Nullable data){
        const unsigned char *dataBuffer = (const unsigned char *)data.bytes;
        if (!dataBuffer) return @"".tr;
        NSUInteger dataLength = data.length;
        NSMutableString *hexString = NSMutableString.initByCapacity(dataLength * 2);
        for (int i = 0; i < dataLength; ++i) {
            [hexString appendFormat:@"%02X", (unsigned int)dataBuffer[i]];
        }return hexString;
    };
}
///【实例方法】NSData对象  转换为  16进制字符串
-(NSString *_Nullable)hexStringByData{
    return NSData.hexStringByData(self);
}
#pragma mark —— 16进制字符串 ==> NSData对象
///【类方法】16进制字符串 转换为 NSData对象
+(JobsRetDataByStrBlock _Nonnull)dataByHexString{
    return ^__kindof NSData *_Nullable(__kindof NSString *_Nullable hexString){
        return jobsMakeMutData(^(__kindof NSMutableData *_Nullable data) {
            for (int i = 0; i + 1 < hexString.length; i += 2) {
                NSString *hexByte = hexString.substringWithRange(NSMakeRange(i, 2));
                NSScanner *scanner = [NSScanner scannerWithString:hexByte];
                unsigned int byteValue;
                [scanner scanHexInt:&byteValue];
                uint8_t byte = (uint8_t)byteValue;
                [data appendBytes:&byte length:1];
            }
        }).copy;
    };
}
///【实例方法】16进制字符串 转换为 NSData对象
-(JobsRetDataByStrBlock _Nonnull)dataByHexString{
    return ^__kindof NSData *_Nullable(__kindof NSString *_Nullable hexString){
        return NSData.dataByHexString(hexString);
    };
}

@end

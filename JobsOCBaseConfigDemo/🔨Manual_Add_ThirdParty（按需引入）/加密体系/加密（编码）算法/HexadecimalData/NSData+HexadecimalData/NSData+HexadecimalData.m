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
+(NSString *_Nullable)hexStringByData:(NSData *_Nonnull)data{
    const unsigned char *dataBuffer = (const unsigned char *)data.bytes;
    if (!dataBuffer) return JobsInternationalization(@"");
    
    NSUInteger dataLength = data.length;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i) {
        [hexString appendFormat:@"%02X", (unsigned int)dataBuffer[i]];
    }return hexString;
}
///【实例方法】NSData对象  转换为  16进制字符串
-(NSString *_Nullable)hexStringByData{
    const unsigned char *dataBuffer = (const unsigned char *)self.bytes;
    if (!dataBuffer) return JobsInternationalization(@"");
    
    NSUInteger dataLength = self.length;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    
    for (int i = 0; i < dataLength; ++i) {
        [hexString appendFormat:@"%02X", (unsigned int)dataBuffer[i]];
    }return hexString;
}
#pragma mark —— 16进制字符串 ==> NSData对象
///【类方法】16进制字符串 转换为 NSData对象
+(NSData *_Nullable)dataByHexString:(NSString *_Nonnull)hexString{
    NSMutableData *data = NSMutableData.data;
    for (int i = 0; i + 1 < hexString.length; i += 2) {
        NSString *hexByte = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexByte];
        unsigned int byteValue;
        [scanner scanHexInt:&byteValue];
        uint8_t byte = (uint8_t)byteValue;
        [data appendBytes:&byte length:1];
    }return data.copy;
}
///【实例方法】16进制字符串 转换为 NSData对象
-(NSData *_Nullable)dataByHexString:(NSString *_Nonnull)hexString{
    NSMutableData *data = NSMutableData.data;
    for (int i = 0; i + 1 < hexString.length; i += 2) {
        NSString *hexByte = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexByte];
        unsigned int byteValue;
        [scanner scanHexInt:&byteValue];
        uint8_t byte = (uint8_t)byteValue;
        [data appendBytes:&byte length:1];
    }return data.copy;
}

@end

//
//  NSData+Base16.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "NSData+Base16.h"

@implementation NSData (Base16)
#pragma mark —— NSData ==> Base16
///【类方法】将NSData对象 转换为 以Base16（也称为十六进制）编码的字符串
+(NSString *_Nullable)base16StringFromData:(NSData *_Nonnull)data{
    /**
     NSData对象的字节序列被遍历，并将每个字节转换为两个十六进制字符
     然后将这些字符拼接到一个NSMutableString中
     最终返回这个Base16字符串
     
     例如：如果NSData对象包含字节序列为{0x48, 0x65, 0x6C, 0x6C, 0x6F}，则这个方法将返回Base16字符串"48656C6C6F"，其中每个字符表示原始字节序列中相应的字节的十六进制值。
     */
    const unsigned char *bytes = (const unsigned char *)[data bytes];
    NSUInteger length = data.length;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:length * 2];
    for (NSUInteger i = 0; i < length; i++) {
        [hexString appendFormat:@"%02X", bytes[i]];
    }return hexString;
}
///【实例方法】将NSData对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16StringByImage{
    /**
     NSData对象的字节序列被遍历，并将每个字节转换为两个十六进制字符
     然后将这些字符拼接到一个NSMutableString中
     最终返回这个Base16字符串
     
     例如：如果NSData对象包含字节序列为{0x48, 0x65, 0x6C, 0x6C, 0x6F}，则这个方法将返回Base16字符串"48656C6C6F"，其中每个字符表示原始字节序列中相应的字节的十六进制值。
     */
    const unsigned char *bytes = (const unsigned char *)[self bytes];
    NSUInteger length = self.length;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:length * 2];
    for (NSUInteger i = 0; i < length; i++) {
        [hexString appendFormat:@"%02X", bytes[i]];
    }return hexString;
}
#pragma mark —— Base16 ==> NSData
///【类方法】将以Base16编码的字符串 转换为 NSData对象
+(NSData *_Nullable)dataWithBase16String:(NSString *_Nonnull)base16StringByImage{
    /**
     首先创建了一个NSMutableData对象，然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值
     然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节
     最后将这个字节添加到NSMutableData中
     完成遍历后，将NSMutableData对象转换为NSData对象，并返回。
     
     例如：如果Base16字符串是"48656C6C6F"，则它将转换为包含字节序列为{0x48, 0x65, 0x6C, 0x6C, 0x6F}的NSData对象。
     */
    NSMutableData *data = NSMutableData.data;
    for (NSUInteger i = 0; i + 1 < base16StringByImage.length; i += 2) {
        NSString *hexChar = [base16StringByImage substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexChar];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        UInt8 byte = (UInt8)intValue;
        [data appendBytes:&byte length:1];
    }return [NSData dataWithData:data];
}
///【实例方法】将以Base16编码的字符串 转换为 NSData对象
-(NSData *_Nullable)dataWithBase16String:(NSString *_Nonnull)base16StringByImage{
    /**
     首先创建了一个NSMutableData对象，然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值
     然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节
     最后将这个字节添加到NSMutableData中
     完成遍历后，将NSMutableData对象转换为NSData对象，并返回。
     
     例如：如果Base16字符串是"48656C6C6F"，则它将转换为包含字节序列为{0x48, 0x65, 0x6C, 0x6C, 0x6F}的NSData对象。
     */
    NSMutableData *data = NSMutableData.data;
    for (NSUInteger i = 0; i + 1 < base16StringByImage.length; i += 2) {
        NSString *hexChar = [base16StringByImage substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexChar];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        UInt8 byte = (UInt8)intValue;
        [data appendBytes:&byte length:1];
    }return [NSData dataWithData:data];
}

@end

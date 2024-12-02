//
//  NSString+Base16.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import "NSString+Base16.h"

@implementation NSString (Base16)
#pragma mark —— Base16 <==> NSString
///【类方法】将Base16字符串 转换回 原始的NSString对象
+(JobsReturnStringByStringBlock _Nonnull)stringByBase16String{
    return ^__kindof NSString *_Nullable(NSString *_Nullable base16StringByImage){
        /**
         首先创建了一个NSMutableData对象
         然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值。然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节
         最后将这个字节添加到NSMutableData中
         完成遍历后，将NSMutableData对象转换为NSString对象，并使用UTF-8编码
         最终返回这个NSString对象。
         
         例如：如果Base16字符串是"48656C6C6F"，则它将转换为原始的NSString对象"Hello"。
         */
        NSMutableData *data = NSMutableData.data;
        for (NSUInteger i = 0; i + 1 < base16StringByImage.length; i += 2) {
            NSString *hexChar = [base16StringByImage substringWithRange:NSMakeRange(i, 2)];
            NSScanner *scanner = [NSScanner scannerWithString:hexChar];
            unsigned int intValue;
            [scanner scanHexInt:&intValue];
            UInt8 byte = (UInt8)intValue;
            [data appendBytes:&byte length:1];
        }return NSString.initByUTF8Data(data);
    };
}
///【实例方法】将Base16字符串 转换回 原始的NSString对象
-(NSString *_Nullable)stringByBase16String{
    /**
     首先创建了一个NSMutableData对象
     然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值。然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节
     最后将这个字节添加到NSMutableData中
     完成遍历后，将NSMutableData对象转换为NSString对象，并使用UTF-8编码
     最终返回这个NSString对象。
     
     例如：如果Base16字符串是"48656C6C6F"，则它将转换为原始的NSString对象"Hello"。
     */
    NSMutableData *data = NSMutableData.data;
    for (NSUInteger i = 0; i + 1 < self.length; i += 2) {
        NSString *hexChar = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexChar];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        UInt8 byte = (UInt8)intValue;
        [data appendBytes:&byte length:1];
    }return NSString.initByUTF8Data(data);
}
///【类方法】将普通的NSString字符串对象 转换为 以Base16（也称为十六进制）编码的字符串
+(JobsReturnStringByStringBlock _Nonnull)base16StringByImage{
    return ^__kindof NSString *_Nullable(NSString *_Nullable string){
        /**
         字符串被转换为NSData对象
         然后该NSData对象的字节序列被转换为十六进制表示
         每个字节被转换为两个十六进制字符，并添加到一个NSMutableString中
         最后返回该字符串
         
         例如：如果原始字符串是"Hello"，则它将转换为Base16字符串"48656C6C6F"，其中每个字符都表示原始字符串中相应的字节的十六进制值。
         */
        NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
        const unsigned char *bytes = (const unsigned char *)data.bytes;
        NSUInteger length = data.length;
        NSMutableString *hexString = [NSMutableString stringWithCapacity:length * 2];
        for (NSUInteger i = 0; i < length; i++) {
            [hexString appendFormat:@"%02X", bytes[i]];
        }return hexString;
    };
}
///【实例方法】将普通的NSString字符串对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16StringByImage{
    /**
     字符串被转换为NSData对象
     然后该NSData对象的字节序列被转换为十六进制表示
     每个字节被转换为两个十六进制字符，并添加到一个NSMutableString中
     最后返回该字符串
     
     例如：如果原始字符串是"Hello"，则它将转换为Base16字符串"48656C6C6F"，其中每个字符都表示原始字符串中相应的字节的十六进制值。
     */
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    const unsigned char *bytes = (const unsigned char *)data.bytes;
    NSUInteger length = data.length;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:length * 2];
    for (NSUInteger i = 0; i < length; i++) {
        [hexString appendFormat:@"%02X", bytes[i]];
    }return hexString;
}
#pragma mark —— Base16 <==> UIImage
///【类方法】将以Base16编码的字符串 转换为 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByBase16String{
    return ^UIImage *_Nullable(NSString *_Nullable base16StringByImage){
        /**
         首先创建了一个NSMutableData对象，然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值
         然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节，最后将这个字节添加到NSMutableData中
         完成遍历后，使用NSData对象初始化UIImage对象，并返回。
         
         例如：如果Base16字符串表示的是一张图片的十六进制表示形式，那么这个方法将返回表示相同图片的UIImage对象。
         */
        NSMutableData *imageData = NSMutableData.data;
        for (NSUInteger i = 0; i + 1 < base16StringByImage.length; i += 2) {
            NSString *hexChar = [base16StringByImage substringWithRange:NSMakeRange(i, 2)];
            NSScanner *scanner = [NSScanner scannerWithString:hexChar];
            unsigned int intValue;
            [scanner scanHexInt:&intValue];
            UInt8 byte = (UInt8)intValue;
            [imageData appendBytes:&byte length:1];
        }return UIImage.imageByData(imageData);
    };
}
///【实例方法】将以Base16编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase16String{
    /**
     首先创建了一个NSMutableData对象，然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值
     然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节，最后将这个字节添加到NSMutableData中
     完成遍历后，使用NSData对象初始化UIImage对象，并返回。
     
     例如：如果Base16字符串表示的是一张图片的十六进制表示形式，那么这个方法将返回表示相同图片的UIImage对象。
     */
    NSMutableData *imageData = NSMutableData.data;
    for (NSUInteger i = 0; i + 1 < self.length; i += 2) {
        NSString *hexChar = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexChar];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        UInt8 byte = (UInt8)intValue;
        [imageData appendBytes:&byte length:1];
    }return UIImage.imageByData(imageData);
}
#pragma mark —— Base16 <==> NSData
///【类方法】将以Base16编码的字符串 转换为 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataWithBase16String{
    return ^NSData *_Nullable(__kindof NSString *_Nullable base16StringByImage){
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
    };
}
///【实例方法】将以Base16编码的字符串 转换为 NSData对象
-(NSData *_Nullable)dataWithBase16String{
    /**
     首先创建了一个NSMutableData对象，然后对Base16字符串进行遍历，每两个字符为一组，表示一个字节的十六进制值
     然后使用NSScanner将这个十六进制字符串转换为无符号整数，再将其转换为UInt8类型的字节
     最后将这个字节添加到NSMutableData中
     完成遍历后，将NSMutableData对象转换为NSData对象，并返回。
     
     例如：如果Base16字符串是"48656C6C6F"，则它将转换为包含字节序列为{0x48, 0x65, 0x6C, 0x6C, 0x6F}的NSData对象。
     */
    NSMutableData *data = NSMutableData.data;
    for (NSUInteger i = 0; i + 1 < self.length; i += 2) {
        NSString *hexChar = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner *scanner = [NSScanner scannerWithString:hexChar];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        UInt8 byte = (UInt8)intValue;
        [data appendBytes:&byte length:1];
    }return [NSData dataWithData:data];
}

@end

//
//  NSData+Base85.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import "NSData+Base85.h"

@implementation NSData (Base85)
#pragma mark —— NSData ==> Base85
///【类方法】将NSData对象 转换为 以Base85编码的字符串
+(NSString *_Nullable)dataToBase85String:(NSData *_Nonnull)data{
    /**
     首先将NSData对象的字节序列按照每4个字节一组进行处理
     然后，对于每组4个字节，它将其转换为一个32位整数，并将该整数映射为5个Base85字符，分别表示4字节的数据
     如果NSData的长度不是4的整数倍，则会处理剩余的字节，以确保所有数据都被正确编码。

     最终，该方法返回一个包含Base85编码后数据的NSString对象。
     */
    NSUInteger length = data.length;
    const unsigned char *bytes = data.bytes;
    NSMutableString *base85String = NSMutableString.string;
    NSUInteger remainder = length % 4;
    
    NSUInteger i;
    for (i = 0; i < length - remainder; i += 4) {
        uint32_t value = (bytes[i] << 24) | (bytes[i + 1] << 16) | (bytes[i + 2] << 8) | bytes[i + 3];
        [base85String appendFormat:@"%c%c%c%c%c",
         (value / (85 * 85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85)) % 85 + 33,
         (value / 85) % 85 + 33,
         value % 85 + 33];
    }
    
    if (remainder > 0) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < remainder; j++) {
            value |= bytes[i + j] << (8 * (3 - j));
        }
        for (NSUInteger j = 0; j < remainder + 1; j++) {
            [base85String appendFormat:@"%c", (value / (uint32_t)pow(85, 4 - j)) % 85 + 33];
        }
    }return base85String;
}
///【实例方法】将NSData对象 转换为 以Base85编码的字符串
-(NSString *_Nullable)dataToBase85String{
    /**
     首先将NSData对象的字节序列按照每4个字节一组进行处理
     然后，对于每组4个字节，它将其转换为一个32位整数，并将该整数映射为5个Base85字符，分别表示4字节的数据
     如果NSData的长度不是4的整数倍，则会处理剩余的字节，以确保所有数据都被正确编码。

     最终，该方法返回一个包含Base85编码后数据的NSString对象。
     */
    NSUInteger length = self.length;
    const unsigned char *bytes = self.bytes;
    NSMutableString *base85String = NSMutableString.string;
    NSUInteger remainder = length % 4;
    
    NSUInteger i;
    for (i = 0; i < length - remainder; i += 4) {
        uint32_t value = (bytes[i] << 24) | (bytes[i + 1] << 16) | (bytes[i + 2] << 8) | bytes[i + 3];
        [base85String appendFormat:@"%c%c%c%c%c",
         (value / (85 * 85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85 * 85)) % 85 + 33,
         (value / (85 * 85)) % 85 + 33,
         (value / 85) % 85 + 33,
         value % 85 + 33];
    }
    
    if (remainder > 0) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < remainder; j++) {
            value |= bytes[i + j] << (8 * (3 - j));
        }
        for (NSUInteger j = 0; j < remainder + 1; j++) {
            [base85String appendFormat:@"%c", (value / (uint32_t)pow(85, 4 - j)) % 85 + 33];
        }
    }return base85String;
}
#pragma mark —— Base85 ==> NSData
///【类方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
+(NSData *_Nullable)dataByBase85String:(NSString *_Nonnull)base85String{
    /**
     首先遍历Base85字符串的每5个字符一组
     然后，对于每组5个字符，它将其解码为一个32位整数，并将整数转换回4个字节的数据
     最后，将这些字节追加到NSMutableData对象中

     最终，该方法返回一个包含解码后数据的NSData对象。
     */
    NSMutableData *data = NSMutableData.data;
    NSUInteger length = [base85String length];
    for (NSUInteger i = 0; i < length; i += 5) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < 5; j++) {
            if (i + j < length) {
                value = value * 85 + ([base85String characterAtIndex:i + j] - 33);
            }
        }
        for (NSUInteger j = 0; j < 4 && i + j < length; j++) {
            uint8_t byte = (value >> (8 * (3 - j))) & 0xFF;
            [data appendBytes:&byte length:1];
        }
    }return data;
}
///【实例方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
-(NSData *_Nullable)dataByBase85String:(NSString *_Nonnull)base85String{
    /**
     首先遍历Base85字符串的每5个字符一组
     然后，对于每组5个字符，它将其解码为一个32位整数，并将整数转换回4个字节的数据
     最后，将这些字节追加到NSMutableData对象中

     最终，该方法返回一个包含解码后数据的NSData对象。
     */
    NSMutableData *data = NSMutableData.data;
    NSUInteger length = [base85String length];
    for (NSUInteger i = 0; i < length; i += 5) {
        uint32_t value = 0;
        for (NSUInteger j = 0; j < 5; j++) {
            if (i + j < length) {
                value = value * 85 + ([base85String characterAtIndex:i + j] - 33);
            }
        }
        for (NSUInteger j = 0; j < 4 && i + j < length; j++) {
            uint8_t byte = (value >> (8 * (3 - j))) & 0xFF;
            [data appendBytes:&byte length:1];
        }
    }return data;
}

@end

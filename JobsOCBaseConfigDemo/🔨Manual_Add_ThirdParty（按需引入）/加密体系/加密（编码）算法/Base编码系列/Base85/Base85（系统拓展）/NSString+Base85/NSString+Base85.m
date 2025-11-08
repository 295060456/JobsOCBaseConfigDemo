//
//  NSString+Base85.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import "NSString+Base85.h"

@implementation NSString (Base85)
#pragma mark —— Base85 <==> NSString
///【类方法】普通的NSString对象 转换成 以Base85编码的字符串
+(JobsRetStringByStringBlock _Nonnull)base85String{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable string){
        return NSData.dataToBase85String(string.UTF8Encoding);
    };
}
///【实例方法】普通的NSString对象 转换成 以Base85编码的字符串
-(NSString *_Nullable)base85String{
    return NSString.base85String(self);
}
///【类方法】以Base85编码的字符串 转换成 普通的NSString对象
+(JobsRetStringByStringBlock _Nonnull)stringByBase85String{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable base85String){
        return NSString.initByUTF8Data(NSString.dataByBase85String(base85String));
    };
}
///【实例方法】以Base85编码的字符串 转换成 普通的NSString对象
-(NSString *_Nullable)stringByBase85String{
    return NSString.stringByBase85String(self);
}
#pragma mark —— Base85 ==> NSData
///【类方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
+(JobsRetDataByStringBlock _Nonnull)dataByBase85String{
    return ^__kindof NSData *_Nullable(__kindof NSString *_Nullable base85String){
        /**
         首先遍历Base85字符串的每5个字符一组
         然后，对于每组5个字符，它将其解码为一个32位整数，并将整数转换回4个字节的数据
         最后，将这些字节追加到NSMutableData对象中

         最终，该方法返回一个包含解码后数据的NSData对象。
         */
        return jobsMakeMutData(^(__kindof NSMutableData * _Nullable data) {
            NSUInteger length = base85String.length;
            for (NSUInteger i = 0; i < length; i += 5) {
                uint32_t value = 0;
                for (NSUInteger j = 0; j < 5; j++) {
                    if (i + j < length) value = value * 85 + ([base85String characterAtIndex:i + j] - 33);
                }
                for (NSUInteger j = 0; j < 4 && i + j < length; j++) {
                    uint8_t byte = (value >> (8 * (3 - j))) & 0xFF;
                    [data appendBytes:&byte length:1];
                }
            }
        });
    };
}
///【实例方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
-(NSData *_Nullable)dataByBase85String{
    return NSString.dataByBase85String(self);
}
#pragma mark —— Base85 ==> UIImage
///【类方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
+(JobsRetImageByStringBlock _Nonnull)imageByBase85String{
    return ^UIImage *_Nullable(__kindof NSString *_Nullable base85String){
        /**
         首先将Base85字符串解析为对应的字节序列
         然后将字节序列转换为NSData对象
         最后使用UIImage的imageWithData:方法将NSData对象转换为UIImage对象
         */
        return UIImage.initByData(jobsMakeMutData(^(__kindof NSMutableData * _Nullable imageData) {
            NSUInteger length = base85String.length;
            for (NSUInteger i = 0; i < length; i += 5) {
                uint32_t value = 0;
                for (NSUInteger j = 0; j < 5; j++) {
                    if (i + j < length) value = value * 85 + ([base85String characterAtIndex:i + j] - 33);
                }
                for (NSUInteger j = 0; j < 4 && i + j < length; j++) {
                    uint8_t byte = (value >> (8 * (3 - j))) & 0xFF;
                    [imageData appendBytes:&byte length:1];
                }
            }
        }));
    };
}
///【实例方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
-(UIImage *_Nullable)imageByBase85String{
    return NSString.imageByBase85String(self);
}

@end

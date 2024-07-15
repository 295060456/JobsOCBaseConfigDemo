//
//  NSData+MIME.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSData+MIME.h"

@implementation NSData (MIME)
#pragma mark —— MIME编码的数据 <==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString{
    NSData *decodedData = [NSData.alloc initWithBase64EncodedString:MIMEString
                                                            options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return decodedData;
}
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString{
    NSData *decodedData = [NSData.alloc initWithBase64EncodedString:MIMEString
                                                            options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return decodedData;
}
///【类方法】NSData对象 转换成 以MIME编码的数据
+(NSString *_Nullable)MIMEStringByImage:(NSData *_Nonnull)data{
    NSString *MIMEString = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return MIMEString;
}
///【实例方法】NSData对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStringByImage{
    NSString *MIMEString = [self base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return MIMEString;
}

@end

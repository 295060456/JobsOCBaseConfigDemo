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
+(JobsReturnDataByStringBlock _Nonnull)dataByMIMEString{
    return ^NSData *_Nullable(__kindof NSString *_Nullable MIMEString){
        return [NSData.alloc initWithBase64EncodedString:MIMEString
                                                 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    };
}
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString{
    return NSData.dataByMIMEString(MIMEString);
}
///【类方法】NSData对象 转换成 以MIME编码的数据
+(JobsReturnStringByDataBlock _Nonnull)MIMEStringByImage{
    return ^__kindof NSString *_Nullable(NSData *_Nullable data){
        return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    };
}
///【实例方法】NSData对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStringByImage{
    return NSData.MIMEStringByImage(self);
}

@end

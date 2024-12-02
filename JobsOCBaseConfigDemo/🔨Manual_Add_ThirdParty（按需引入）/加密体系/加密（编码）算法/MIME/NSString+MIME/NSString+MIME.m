//
//  NSString+MIME.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "NSString+MIME.h"

@implementation NSString (MIME)
#pragma mark —— MIME编码的数据 <==> NSString对象
///【类方法】以MIME编码的字符串数据 转换成 普通NSString对象
+(JobsReturnStringByStringBlock _Nonnull)stringByMIMEData{
    return ^__kindof NSString *_Nullable(NSString *_Nullable MIMEString){
        return NSString.initByUTF8Data([NSData.alloc initWithBase64EncodedString:MIMEString options:0]);
    };
}
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(NSString *_Nullable)mimeData{
    return NSString.stringByMIMEData(self);
}
#pragma mark —— MIME编码的数据 ==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataByMIMEString{
    return ^NSData *_Nullable(__kindof NSString *_Nullable MIMEString){
        return [NSData.alloc initWithBase64EncodedString:MIMEString
                                                 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    };
}
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString{
    return NSString.dataByMIMEString(self);
}
#pragma mark —— MIME编码的数据 ==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByMIMEString{
    return ^UIImage *_Nullable(NSString *_Nullable MIMEString){
        return UIImage.imageByData(NSData.dataByMIMEString(MIMEString));
    };
}
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString{
    return NSString.imageByMIMEString(self);
}

@end

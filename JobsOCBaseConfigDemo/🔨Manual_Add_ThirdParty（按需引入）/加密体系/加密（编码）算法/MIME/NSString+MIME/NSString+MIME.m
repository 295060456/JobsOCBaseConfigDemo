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
+(NSString *_Nullable)stringByMIMEData:(NSString *)MIMEString{
    return NSString.initByUTF8Data([NSData.alloc initWithBase64EncodedString:MIMEString options:0]);
}
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(NSString *_Nullable)stringByMIMEData:(NSString *)MIMEString{
    return NSString.initByUTF8Data([NSData.alloc initWithBase64EncodedString:MIMEString options:0]);
}
///【类方法】以MIME编码的字符串数据 转换成 普通NSString对象
+(NSString *_Nullable)MIME:(NSString *)MIMEString{
    return NSString.initByUTF8Data([NSData.alloc initWithBase64EncodedString:MIMEString options:0]);
}
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(NSString *_Nullable)MIME{
    return NSString.initByUTF8Data([NSData.alloc initWithBase64EncodedString:self options:0]);
}
#pragma mark —— MIME编码的数据 ==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(NSData *_Nullable)dataByMIMEString:(NSString *)MIMEString{
    NSData *decodedData = [NSData.alloc initWithBase64EncodedString:MIMEString
                                                            options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return decodedData;
}
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString:(NSString *)MIMEString{
    NSData *decodedData = [NSData.alloc initWithBase64EncodedString:MIMEString
                                                            options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return decodedData;
}
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString{
    NSData *decodedData = [NSData.alloc initWithBase64EncodedString:self
                                                            options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return decodedData;
}
#pragma mark —— MIME编码的数据 ==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(UIImage *_Nullable)imageByMIMEString:(NSString *)MIMEString{
    NSData *imageData = NSData.dataByMIMEString(MIMEString);
    UIImage *image = UIImage.imageByData(imageData);
    return image;
}
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString:(NSString *)MIMEString{
    NSData *imageData = NSData.dataByMIMEString(MIMEString);
    UIImage *image = UIImage.imageByData(imageData);
    return image;
}
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString{
    NSData *imageData = NSData.dataByMIMEString(self);
    UIImage *image = UIImage.imageByData(imageData);
    return image;
}

@end

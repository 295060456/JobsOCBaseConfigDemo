//
//  NSString+MIME.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "NSData+MIME.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MIME)
#pragma mark —— MIME编码的数据 <==> NSString对象
///【类方法】以MIME编码的字符串数据 转换成 普通NSString对象
+(NSString *_Nullable)stringByMIMEData:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(NSString *_Nullable)stringByMIMEData:(NSString *_Nonnull)MIMEString;
///【类方法】以MIME编码的字符串数据 转换成 普通NSString对象
+(NSString *_Nullable)MIME:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(NSString *_Nullable)MIME;
#pragma mark —— MIME编码的数据 ==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString;
#pragma mark —— MIME编码的数据 ==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(UIImage *_Nullable)imageByMIMEString:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString;

@end

NS_ASSUME_NONNULL_END

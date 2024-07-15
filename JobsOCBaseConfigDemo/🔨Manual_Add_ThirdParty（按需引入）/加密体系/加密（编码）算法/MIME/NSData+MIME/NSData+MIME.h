//
//  NSData+MIME.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (MIME)
#pragma mark —— MIME编码的数据 <==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString:(NSString *_Nonnull)MIMEString;
///【类方法】NSData对象 转换成 以MIME编码的数据
+(NSString *_Nullable)MIMEStringByImage:(NSData *_Nonnull)data;
///【实例方法】NSData对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStringByImage;

@end

NS_ASSUME_NONNULL_END

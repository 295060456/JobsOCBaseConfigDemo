//
//  UIImage+MIME.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <UIKit/UIKit.h>
#import "NSData+MIME.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MIME)
#pragma mark —— MIME编码的数据 <==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(UIImage *_Nullable)imageByMIMEString:(NSString *_Nonnull)MIMEString;
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString:(NSString *_Nonnull)MIMEString;
///【类方法】UIImage对象 转换成 以MIME编码的数据
+(NSString *_Nullable)MIMEStringByImage:(UIImage *_Nonnull)image;
///【实例方法】UIImage对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStr;

@end

NS_ASSUME_NONNULL_END

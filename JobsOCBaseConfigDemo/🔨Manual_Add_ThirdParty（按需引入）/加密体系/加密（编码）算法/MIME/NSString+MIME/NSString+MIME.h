//
//  NSString+MIME.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "NSData+MIME.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MIME)
#pragma mark —— MIME编码的数据 <==> NSString对象
///【类方法】以MIME编码的字符串数据 转换成 普通NSString对象
+(JobsReturnStringByStringBlock _Nonnull)stringByMIMEData;
///【实例方法】以MIME编码的字符串数据 转换成 普通NSString对象
-(NSString *_Nullable)mimeData;
#pragma mark —— MIME编码的数据 ==> NSData对象
///【类方法】以MIME编码的数据 转换成 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataByMIMEString;
///【实例方法】以MIME编码的数据 转换成 NSData对象
-(NSData *_Nullable)dataByMIMEString;
#pragma mark —— MIME编码的数据 ==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByMIMEString;
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString;

@end

NS_ASSUME_NONNULL_END

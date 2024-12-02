//
//  UIImage+MIME.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <UIKit/UIKit.h>
#import "NSData+MIME.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (MIME)
#pragma mark —— MIME编码的数据 <==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByMIMEString;
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(JobsReturnImageByStringBlock _Nonnull)imageByMIMEString;
///【类方法】UIImage对象 转换成 以MIME编码的数据
+(JobsReturnStringByImageBlock _Nonnull)MIMEStringByImage;
///【实例方法】UIImage对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStr;

@end

NS_ASSUME_NONNULL_END

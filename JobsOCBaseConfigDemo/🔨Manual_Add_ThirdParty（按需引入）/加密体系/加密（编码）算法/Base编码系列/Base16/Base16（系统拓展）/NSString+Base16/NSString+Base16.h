//
//  NSString+Base16.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Base16)
#pragma mark —— Base16 <==> NSString
///【类方法】将Base16字符串 转换回 原始的NSString对象
+(JobsReturnStringByStringBlock _Nonnull)stringByBase16String;
///【实例方法】将Base16字符串 转换回 原始的NSString对象
-(NSString *_Nullable)stringByBase16String;
///【类方法】将普通的NSString字符串对象 转换为 以Base16（也称为十六进制）编码的字符串
+(JobsReturnStringByStringBlock _Nonnull)base16StringByImage;
///【实例方法】将普通的NSString字符串对象 转换为 以Base16（也称为十六进制）编码的字符串
-(NSString *_Nullable)base16StringByImage;
#pragma mark —— Base16 <==> UIImage
///【类方法】将以Base16编码的字符串 转换为 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByBase16String;
///【实例方法】将以Base16编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase16String;
#pragma mark —— Base16 <==> NSData
///【类方法】将以Base16编码的字符串 转换为 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataWithBase16String;
///【实例方法】将以Base16编码的字符串 转换为 NSData对象
-(NSData *_Nullable)dataWithBase16String;

@end

NS_ASSUME_NONNULL_END

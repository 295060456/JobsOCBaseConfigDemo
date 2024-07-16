//
//  UIImage+HexadecimalData.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HexadecimalData)
#pragma mark —— UIImage对象 ==> 16进制字符串
///【类方法】UIImage对象 转换为 16进制字符串
+(NSString *_Nullable)hexStringByImage:(UIImage *_Nonnull)image;
///【实例方法】UIImage对象 转换为 16进制字符串
-(NSString *_Nullable)hexStr;
#pragma mark —— 16进制字符串 ==> UIImage对象
///【类方法】16进制字符串 转换为 UIImage对象
+(UIImage *_Nullable)imageByHexString:(NSString *_Nonnull)hexString;
///【实例方法】16进制字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByHexString:(NSString *_Nonnull)hexString;

@end

NS_ASSUME_NONNULL_END
